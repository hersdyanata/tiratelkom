<?php

namespace App\Services;

use DB;
use Illuminate\Support\Collection;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\App;
use Illuminate\Http\Request;

use App\Models\TraMomModel as MomHeader;
use App\Models\TraMomTypeModel as MomTypeItem;
use App\Models\TraMomParticipantModel as MomParticipantItem;
use App\Models\TraMomAgendaModel as MomAgendaItem;
use App\Models\TraMomDiscussModel as MomDiscussItem;
use App\Models\TraMomProgressModel as MomProgressItem;

class DashboardService{

    protected $q_dashboard;

    public function __construct(){
        $this->q_dashboard = DB::table('tra_mom')
                                ->leftJoin('tra_mom_discuss', 'discuss_mom_id', 'mom_id');
    }
    
    public function get_mom_all(){
        $data = MomHeader::all();
        return $data;
    }

    public function get_mom_by_category($CategoryID){
        $data = MomHeader::where('mom_title', $CategoryID)->get();
        return $data;
    }

    public function get_mom_by_category_and_status($CategoryID, $Status){
        $data = MomHeader::where(['mom_title' => $CategoryID, 
                                  'mom_status' => $Status
                                ])->get();
        return $data;
    }

    public function get_mom_by_uic($id){
        $data = $this->q_dashboard->where('discuss_uic_id', $id)->get();
        return $data;
    }

}