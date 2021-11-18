<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\GlobalService;
use App\Services\MomService;
use App\Models\TraMomAgendaModel as MomAgendaItem;
use App\Models\MstUICModel as UIC;

class GlobalParamsController extends Controller
{
    public $core;
    public function __construct(){
        // 
    }

    public function get_category_mom(GlobalService $global){
        return $global->get_category_mom();
    } 

    public function get_meeting_called_by(GlobalService $global){
        return $global->get_meeting_called_by();
    }   
    
}