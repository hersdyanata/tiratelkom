<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TraMomTypeModel extends Model
{
    protected $table = 'tra_mom_type';
    protected $primaryKey = ['mom_id', 'type_id'];
    public $timestamps = false;

    protected $fillable = [
        'mom_id',
        'type_id', 
    ];
}
