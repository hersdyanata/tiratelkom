<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MomTypeModel extends Model
{
    protected $table = 'master_type';
    protected $primaryKey = 'type_id';
    public $timestamps = false;

    protected $fillable = [
        'type_desc'
    ];
}
