<?php

namespace App\Models;

// use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\User;
use OpenApi\Annotations as OA;


/**
 * Class Book.
 * 
 * @author  Peter <peter.422023020@civitas.ukrida.ac.id>
 * 
 * @OA\Schema(
 *     description="Drone model",
 *     title="Drone model",
 *     required={"title", "author"},
 *     @OA\Xml(
 *         name="Drone"
 *     )
 * )
 */


class Drone extends Model
{
    // use HasFactory;
    use SoftDeletes;
    protected $table = 'drones';
    protected $fillable = [
        'id',
        'cover',
        'drone_name',
        'producer',
        'production_year',
        'price',
        'description',
        'created_at',
        'created_by',
        'updated_at',
        'updated_by',
    ];
    
    public function data_adder(){
        return $this->belongsTo(User::class, 'created_by', 'id');
    }
}
