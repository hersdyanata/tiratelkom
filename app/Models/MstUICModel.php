<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MstUICModel extends Model
{
    protected $table = 'master_uic';
    protected $primaryKey = 'uic_id';
    public $timestamps = false;

    protected $fillable = [
        'uic_code',
        'uic_desc'
    ];

    public function getAttr_description(){
        return "{$this->uic_desc}";
    }

    public function getAttr_code(){
        return "{$this->uic_code}";
    }
}
