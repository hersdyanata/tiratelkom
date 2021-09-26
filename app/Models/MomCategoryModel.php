<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MomCategoryModel extends Model
{
    protected $table = 'master_category';
    protected $primaryKey = 'category_id';
    public $timestamps = false;

    protected $fillable = [
        'category_desc'
    ];
}
