<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\TraMomModel as MomHeader;
use App\Models\MomCategoryModel as Kategori;
use App\Models\TraMomDiscussModel as Discuss;
use App\Models\MstUICModel as UIC;

use App\Services\DashboardService;

class DashboardController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth', 'granted', 'verified']);
    }

    public function index(){
        return view('modules.dashboard.index')
                ->with([
                    'title' => 'Dashboard',
                ]);
    }

    public function extended_page(Request $r){
        if($r->type == 'A'){
            $view = $this->all_mom('A');
        }elseif($r->type == 'O'){
            $view = $this->open_mom('O');
        }elseif($r->type == 'C'){
            $view = $this->closed_mom('C');
        }else{
            $view = $this->list_assignment('L');
        }

        return response()->json($view, 200);
    }

    public function extended_page_assignment(Request $r){
        $uic_code = UIC::where('uic_id', $r->uic_id)->pluck('uic_code')->first();
        if($r->type == 'A'){
            $view = $this->all_mom_assignment($uic_code, $r->uic_id);
        }elseif($r->type == 'O'){
            $view = $this->open_mom_assignment($uic_code, $r->uic_id);
        }elseif($r->type == 'C'){
            $view = $this->close_mom_assignment($uic_code, $r->uic_id);
        }

        return response()->json($view, 200);
    }

    public function list_assignment($post){
        $view = view('modules.dashboard.list_assignment')
                ->with([
                    'title' => 'List Assignment Unit',
                    'uic' => UIC::all(),
                ])
                ->render();

        return $view;
    }

    public function all_mom($status){
        $view = view('modules.dashboard.extended_page')
                ->with([
                    'title' => 'List All MoM',
                    'kategori' => Kategori::all(),
                    'status' => $status,
                    'uic_id' => null,
                    'visible' => "unhidden",
                ])
                ->render();

        return $view;
    }


    public function open_mom($status){
        $view = view('modules.dashboard.extended_page')
                ->with([
                    'title' => 'List Open MoM',
                    'kategori' => Kategori::all(),
                    'status' => $status,
                    'uic_id' => null,
                    'visible' => "unhidden",
                ])
                ->render();

        return $view;
    }

    public function closed_mom($status){
        $view = view('modules.dashboard.extended_page')
                ->with([
                    'title' => 'List Closed MoM',
                    'kategori' => Kategori::all(),
                    'status' => $status,
                    'uic_id' => null,
                    'visible' => "unhidden",
                ])
                ->render();

        return $view;
    }

    public function all_mom_assignment($uic_code, $uic_id){ 
        $view = view('modules.dashboard.assignment_page')
                ->with([
                    'title' => 'List All MoM ('.$uic_code.')',
                    'status' => 'A',
                    'uic_code' => $uic_code,
                    'uic_id' => $uic_id
                ])
                ->render();

        return $view;
    }

    public function open_mom_assignment($uic_code, $uic_id){ 
        $view = view('modules.dashboard.assignment_page')
                ->with([
                    'title' => 'List Open MoM ('.$uic_code.')',
                    'status' => 'O',
                    'uic_code' => $uic_code,
                    'uic_id' => $uic_id
                ])
                ->render();

        return $view;
    }

    public function close_mom_assignment($uic_code, $uic_id){ 
        $view = view('modules.dashboard.assignment_page')
                ->with([
                    'title' => 'List Close MoM ('.$uic_code.')',
                    'status' => 'C',
                    'uic_code' => $uic_code,
                    'uic_id' => $uic_id
                ])
                ->render();

        return $view;
    }

    public function mom_per_assignment(Request $r){
        $uic_code = UIC::where('uic_id', $r->uic_id)->pluck('uic_code')->first();
        $view = view('modules.dashboard.extended_page')
                ->with([
                    'title' => 'List Assignment ('.$uic_code.')',
                    'status' => $r->uic_id,
                    'uic_id' => $r->uic_id,
                    'visible' => "hidden",
                ])
                ->render();

        return $view;
    }


    public function filter_mom(DashboardService $Dashboard, Request $r){
        if($r->status_mom == 'L' or $r->status_mom == 'O' or $r->status_mom == 'C'){
            $data = $Dashboard->get_mom_by_category_and_status($r->kategori_mom, $r->status_mom);
        }elseif($r->status_mom == 'A'){
            $data = $Dashboard->get_mom_by_category($r->kategori_mom);
        }

        $table = view('modules.dashboard.table_mom')
                ->with([
                    'moms' => $data
                ])->render();

        return response()->json($table, 200);
    }

}
