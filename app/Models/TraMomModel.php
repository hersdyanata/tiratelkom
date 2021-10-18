<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TraMomModel extends Model
{
    protected $table = 'tra_mom';
    protected $primaryKey = 'mom_id';
    public $timestamps = false;

    protected $fillable = [
        'mom_title',
        'mom_event',
        'mom_date',
        'mom_time',
        'mom_duration',
        'mom_location',
        'mom_notulen_by',
        'mom_called_by',
        'mom_status',
    ];
}
