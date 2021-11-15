<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TraMomProgressModel extends Model
{
    protected $table = 'tra_mom_progress';
    protected $primaryKey = false;
    public $timestamps = false;

    protected $fillable = [
        'progress_mom_id',
        'progress_agenda_id',
        'progress_discuss_id',
        'progress_id',
        'progress_date',
        'progress_desc',
    ];
}