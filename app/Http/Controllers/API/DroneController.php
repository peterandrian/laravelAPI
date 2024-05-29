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
      *     )
      * )
      */
     public function index()
     {
         return Drone::get();
     }
 
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
             throw new HttpException(400, "Invalid Data : {$exception->getMessage}");
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
                'drone_name'  => 'required|unique:drones',
                'producer'  => 'required|max:100',
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