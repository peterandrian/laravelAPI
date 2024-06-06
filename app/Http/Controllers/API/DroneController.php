<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Symfony\Component\HttpKernel\Exception\HttpException;
use App\Models\Drone;
use OpenApi\Annotations as OA;
use Validator;

/**
 * Class Controller,
 * 
 * @author Peter <peter.422023020@civitas.ukrida.ac.id>
 */

 class DroneController extends Controller
 {
    /** 
     * @OA\Get(
     *     path="/api/drone",
     *     tags={"Drone"},
     *     summary="Display a listing of the items",
     *     operationId="index",
     *     @OA\Response(
     *         response=200,
     *         description="successful",
     *         @OA\JsonContent()
     *          )
     *      ),
     *     @OA\Parameter(
     *         name="_page",
     *         in="query",
     *         description="current page",
     *         required=true,
     *         @OA\Schema(
     *             type="integer",
     *             format="int64",
     *             example=1
     *         )
     *     ),
     *     @OA\Parameter(
     *         name="_limit",
     *         in="query",
     *         description="max item in a page",
     *         required=true,
     *         @OA\Schema(
     *             type="integer",
     *             format="int64",
     *             example=10
     *         )
     *     ),
     *     @OA\Parameter(
     *         name="_search",
     *         in="query",
     *         description="word to search",
     *         required=false,
     *         @OA\Schema(
     *             type="string",
     *         )
     *     ),
     *     @OA\Parameter(
     *         name="_producer",
     *         in="query",
     *         description="search by producer like DJI, etc",
     *         required=false,
     *         @OA\Schema(
     *             type="string",
     *         )
     *     ),
     *     @OA\Parameter(
     *         name="_sort_by",
     *         in="query",
     *         description="word to search",
     *         required=false,
     *         @OA\Schema(
     *             type="string",
     *             example="latest"
     *         )
     *     ),
     * )
     */
     public function index(Request $request)
     {
        try {
            $data['filter']       = $request->all();
            $page                 = $data['filter']['_page']  = (@$data['filter']['_page'] ? intval($data['filter']['_page']) : 1);
            $limit                = $data['filter']['_limit'] = (@$data['filter']['_limit'] ? intval($data['filter']['_limit']) : 1000);
            $offset               = ($page?($page-1)*$limit:0);
            $data['products']     = Drone::whereRaw('1 = 1');
            
            if($request->get('_search')){
                $data['products'] = $data['products']->whereRaw('(LOWER(drone_name) LIKE "%'.strtolower($request->get('_search')).'%")');
            }
            if($request->get('_producer')){
                $data['products'] = $data['products']->whereRaw('LOWER(producer) = "'.strtolower($request->get('_producer')).'"');
            }
            if($request->get('_sort_by')){
            switch ($request->get('_sort_by')) {
                default:
                case 'latest_production':
                $data['products'] = $data['products']->orderBy('production_year','DESC');
                break;
                case 'latest_added':
                $data['products'] = $data['products']->orderBy('created_at','DESC');
                break;    
                case 'name_asc':
                $data['products'] = $data['products']->orderBy('drone_name','ASC');
                break;
                case 'name_desc':
                $data['products'] = $data['products']->orderBy('drone_name','DESC');
                break;
                case 'price_asc':
                $data['products'] = $data['products']->orderBy('price','ASC');
                break;
                case 'price_desc':
                $data['products'] = $data['products']->orderBy('price','DESC');
                break;
            }
            }
            $data['products_count_total']   = $data['products']->count();
            $data['products']               = ($limit==0 && $offset==0)?$data['products']:$data['products']->limit($limit)->offset($offset);
            // $data['products_raw_sql']       = $data['products']->toSql();
            $data['products']               = $data['products']->get();
            $data['products_count_start']   = ($data['products_count_total'] == 0 ? 0 : (($page-1)*$limit)+1);
            $data['products_count_end']     = ($data['products_count_total'] == 0 ? 0 : (($page-1)*$limit)+sizeof($data['products']));
           return response()->json($data, 200);

        } catch(\Exception $exception) {
            throw new HttpException(400, "Invalid data : {$exception->getMessage()}");
        }     }
 
     /**
      * @OA\Post(
      *     path="/api/drone",
      *     tags={"Drone"},
      *     summary="Store a newly created item",
      *     operationId="store",
      *     @OA\Response(
      *         response=400,
      *         description="Invalid input",
      *         @OA\JsonContent()
      *     ),
      *     @OA\Response(
      *         response=201,
      *         description="Successful",
      *         @OA\JsonContent()
      *     ),
      *     @OA\RequestBody(
      *         required=true,
      *         description="Request body description",
      *         @OA\JsonContent(
      *             ref="#/components/schemas/Drone",
      *             example={"id": 1, "drone_name": "DJI Mavic 3 Pro", "price": 33000000, "producer" : "DJI", "production_year": "2023",
      *                      "description": "DJI Mavic 3 Pro is a triple-lens flagship camera drone with multiple focal lengths. Mavic 3 Pro has a 4/3 CMOS Hasselblad camera and dual tele cameras.",
      *                      "cover": "https://sinarphoto.com/prd/l/dji-mavic-3-pro-drone-with-dji-rc-01.jpg",
      *                     }
      *         ),
      *     ),
      *     security={{"passport_token_ready":{}, "passport":{}}}
      * )
      */
     public function store(Request $request)
     {
         try{
             $validator = Validator::make($request->all(), [
                 'drone_name'  => 'required|unique:drones',
                 'producer'  => 'required|max:100',
             ]);
             if ($validator->fails()) {
                 throw new HttpException(400, $validator->messages()->first());
             }
             $drone = new Drone;
             $drone->fill($request->all())->save();
             return $drone;
 
         } catch(\Exception $exception) {
             throw new HttpException(400, "Invalid Data : {$exception->getMessage()}");
         }
     }
 
     /**
      * @OA\Get(
      *     path="/api/drone/{id}",
      *     tags={"Drone"},
      *     summary="Display the specified item",
      *     operationId="show",
      *     @OA\Response(
      *         response=404,
      *         description="Item not found",
      *         @OA\JsonContent()
      *     ),
      *     @OA\Response(
      *         response=400,
      *         description="Invalid input",
      *         @OA\JsonContent()
      *     ),
      *     @OA\Response(
      *         response=200,
      *         description="Successful",
      *         @OA\JsonContent()
      *     ),
      *     @OA\Parameter(
      *         name="id",
      *         in="path",
      *         description="ID of item that needs to be displayed",
      *         required=true,
      *         @OA\Schema(
      *             type="integer",
      *             format="int64"
      *         )
      *     ),
      * )
      */
     public function show($id)
     {
         $drone = Drone::find($id);
         if(!$drone){
             throw new HttpException(404, 'Item not found');
         }
         return $drone;
     }
 
     /**
      * @OA\Put(
      *     path="/api/drone/{id}",
      *     tags={"Drone"},
      *     summary="Update the specified item",
      *     operationId="update",
      *     @OA\Response(
      *         response=404,
      *         description="Item not found",
      *         @OA\JsonContent()
      *     ),
      *     @OA\Response(
      *         response=400,
      *         description="Invalid input",
      *         @OA\JsonContent()
      *     ),
      *     @OA\Response(
      *         response=200,
      *         description="Successful",
      *         @OA\JsonContent()
      *     ),
      *     @OA\Parameter(
      *         name="id",
      *         in="path",
      *         description="ID of item that needs to be updated",
      *         required=true,
      *         @OA\Schema(
      *             type="integer",
      *             format="int64"
      *         )
      *     ),
      *     @OA\RequestBody(
      *         required=true,
      *         description="Request body description",
      *         @OA\JsonContent(
      *             ref="#/components/schemas/Drone",
      *             example={"id": 1, "drone_name": "DJI Mavic 3 Pro", "price": 33000000, "producer" : "DJI", "production_year": "2023",
      *                      "description": "DJI Mavic 3 Pro is a triple-lens flagship camera drone with multiple focal lengths. Mavic 3 Pro has a 4/3 CMOS Hasselblad camera and dual tele cameras.",}
      *         ),
      *     ),
      *     security={{"passport_token_ready":{},"passport":{}}}
      * )
      */
     public function update(Request $request, string $id)
     {
         $drone = Drone::find($id);
         if(!$drone) {
             throw new HttpException (404, 'Item not found');
         }
  
         try {
            $validator = Validator::make($request->all(), [
                'drone_name'  => 'required',
            ]);
            if ($validator->fails()) {
                throw new HttpException (400, $validator->messages()->first());
            }
             $drone->fill($request->all())->save();
             return response()->json(array('message' => 'Updated successfully'), 200);
  
         } catch(\Exception $exception) {
             throw new HttpException(400, "Invalid data: {$exception->getMessage()}");
         }
     }
  
      /**
       * @OA\Delete(
       *      path="/api/drone/{id}",
       *      tags={"Drone"},
       *      summary="Remove the specified item",
       *      operationId="destroy",
       *      @OA\Response(
       *          response=404,
       *          description="Item not found",
       *          @OA\JsonContent()
       *      ),
       *      @OA\Response(
       *          response=400,
       *          description="Invalid input",
       *          @OA\JsonContent()
       *      ),
       *      @OA\Response(
       *          response=200,
       *          description="Successful",
       *          @OA\JsonContent()
       *      ),
       *      @OA\Parameter(
       *          name="id",
       *          in="path",
       *          description="ID of item that needs to be removed",
       *          required=true,
       *          @OA\Schema(
       *              type="integer",
       *              format="int64"
       *          )
       *      ),
       *     security={{"passport_token_ready":{},"passport":{}}}
       * )
       */
      public function destroy(string $id)
      {
          $drone = Drone::find($id);
          if(!$drone) {
              throw new HttpException (404, 'Item not found');
          }
      
          try {
              $drone->delete();
              return response()->json(array('message' => 'Deleted successfully'), 200);
  
          } catch(\Exception $exception) {
              throw new HttpException (400, "Invalid data: ($exception->getMessage()}");
          }
      }
  }