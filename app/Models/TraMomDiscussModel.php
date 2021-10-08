<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TraMomDiscussModel extends Model
{
    protected $table = 'tra_mom_discuss';
    protected $primaryKey = ['discuss_id','discuss_agenda_id','discuss_mom_id'];
    public $timestamps = false;

    protected $fillable = [
        'discuss_mom_id',
        'discuss_agenda_id',
        'discuss_pointer',
        'discuss_assignment',
        'discuss_uic_id',
        'discuss_due_date',
        'discuss_priority',
        'discuss_progress',
        'discuss_status',
        'discuss_created_date',
    ];
}