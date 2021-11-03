<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TraMomTypeModel extends Model
{
    protected $table = 'tra_mom_type';
    protected $primaryKey = false; //['mom_id', 'type_id'];
    public $timestamps = false;

    protected $fillable = [
        'mom_id',
        'type_id', 
    ];

    public function getAttr_type_desc(){
        $data = $this->hasOne(MomTypeModel::class,'type_id','type_id')->pluck('type_desc')->max();
        return $data;
    }
}
