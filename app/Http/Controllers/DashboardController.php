<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\TraMomModel as MomHeader;
use App\Models\MomCategoryModel as Kategori;

class DashboardController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth', 'granted']);
    }

    public function index(){
        return view('modules.dashboard.index')
                ->with([
                    'title' => 'Dashboard',
                ]);
    }

    public function extended_page(Request $r){
        if($r->type == 'L'){
            $view = $this->list_assignment('L');
        }elseif($r->type == 'A'){
            $view = $this->all_mom('A');
        }elseif($r->type == 'O'){
            $view = $this->open_mom('O');
        }elseif($r->type == 'C'){
            $view = $this->closed_mom('C');
        }

        return response()->json($view, 200);
    }

    public function list_assignment($post){
        $view = view('modules.dashboard.list_assignment')
                ->with([
                    'title' => 'List Assignment Unit'
                ])
                ->render();

        return $view;
    }

    public function all_mom($status){
        $view = view('modules.dashboard.extended_page')
                ->with([
                    'title' => 'All MoM',
                    'kategori' => Kategori::all(),
                    'status' => $status,
                ])
                ->render();

        return $view;
    }

    public function open_mom($status){
        $view = view('modules.dashboard.extended_page')
                ->with([
                    'title' => 'Open MoM',
                    'kategori' => Kategori::all(),
                    'status' => $status,
                ])
                ->render();

        return $view;
    }

    public function closed_mom($status){
        $view = view('modules.dashboard.extended_page')
                ->with([
                    'title' => 'Closed MoM',
                    'kategori' => Kategori::all(),
                    'status' => $status,
                ])
                ->render();

        return $view;
    }

    public function filter_mom(Request $r){
        if($r->mom_status != 'A'){
            $data = MomHeader::where([
                'mom_title' => $r->kategori_mom,
                'mom_status' => $r->status_mom
            ])->get();
        }else{
            $data = MomHeader::where([
                'mom_title' => $r->kategori_mom
            ])->get();              
        }

        $table = view('modules.dashboard.table_mom')
                ->with([
                    'moms' => $data
                ])->render();

        return response()->json($table, 200);
    }

}
