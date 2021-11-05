<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\GlobalService;
use App\Services\MomService;

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

    public function get_discuss_konten(MomService $mom, request $request){
        $agenda = $mom->get_discuss_by_mom_id($request->mom_id);
        $view_diskusi = view('modules.mom.table_diskusi')->with('agenda', $agenda)->render();
        return response()->json($view_diskusi, 200);
    }   
    
}