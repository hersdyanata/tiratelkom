<?php

namespace App\Http\Controllers;
use App\Models\MomTypeModel as momType;
use App\Models\MomCategoryModel as momCategory;
use App\Models\TraMomAgendaModel as MomAgendaItem;
use App\Models\TraMomModel as MomItem;
use App\Models\MstUICModel as UIC;
use App\Models\User as Users;
use Arr;
use Collections;

use Illuminate\Http\Request;
use App\Services\Core;
use App\Services\MomService;

use App\Http\Requests\MomRequest;
use App\Http\Requests\AgendaRequest;
use App\Http\Requests\DiscussRequest;

class MomController extends Controller
{
    public $core;
    public $privileges;
    public function __construct(Core $core){
        $this->middleware(['auth', 'granted']);
        
        $this->core = $core;
    }

    // tab : 9,
    // comma : 188

    public function index()
    {
        $title = 'Create MoM';
        return view('modules.mom.create')
                ->with([
                    'title' => $title,
                    'dataType' => momType::get(),
                    'dataCategory' => momCategory::get(),
                    'users' => Users::get()
                ]);
    }

    public function store(MomService $mom, MomRequest $request)
    {
        $res = $mom->create_mom($request->all());
        return response()->json($res, 200);
    }

    public function store_agenda(MomService $mom, AgendaRequest $request){
        $res = $mom->create_mom_agenda($request->all());
        $agenda = MomAgendaItem::where('mom_id', $request->agenda_mom_id)->get();
        $view_diskusi = view('modules.mom.table_diskusi')->with('agenda', $agenda)->render();
        return response()->json($view_diskusi, 200);
    }

    public function add_row_poin(Request $request){
        $row = view('modules.mom.row_poin')
                ->with([
                    'agenda' => $request,
                    'uics'   => UIC::get()
                ])->render();
        return response()->json($row, 200);
    }

    public function store_draft_mom(MomService $mom, DiscussRequest $request){
        $res = $mom->create_draft_mom($request->all());
        $mom = MomItem::where('mom_id', $request->mom_id)->pluck('mom_id')->first();
        return response()->json($mom, 200);
    }

    public function store_submit_mom(MomService $mom, Request $request){
         $res = $mom->submit_mom($request->all());  
        return response()->json($res, 200);
    }

    public function store_update_mom(MomService $mom, MomRequest $request){
        $res = $mom->update_mom($request->all());
        return response()->json($res, 200);
    }

    public function store_update_agenda(MomService $mom, AgendaRequest $request){
        $res = $mom->update_agenda($request->all());
        $agenda = MomAgendaItem::where('mom_id', $request->agenda_mom_id)->get();
        $view_diskusi = view('modules.mom.table_diskusi')->with('agenda', $agenda)->render();
        return response()->json($view_diskusi, 200);
    }

    public function show(MomService $mom, $id){
        $title = 'Preview MoM';
        $DataMoM  = $mom->get_mom_by_mom_id($id);
        $DataType = $mom->get_type_by_mom_id($id);
        $DataParticipant = $mom->get_participant_by_mom_id($id);
        $DataAgenda = $mom->get_agenda_by_mom_id($id);
        return view('modules.mom.preview_mom')
                ->with([
                    'title' => $title,
                    'DataMoM' => $DataMoM,
                    'DataType' => $DataType,
                    'DataParticipant' => $DataParticipant,
                    'DataAgenda' => $DataAgenda,
                    'MstType' => momType::get(),
                ]);
    }

    public function edit_mom(MomService $mom, $id){
        $title = 'MoM Review [Notulen Edit]';
        $DataMoM  = $mom->get_mom_by_mom_id($id);
        $DataType = $mom->get_type_by_mom_id($id);
        $DataParticipant = $mom->get_participant_by_mom_id($id);
        $DataAgenda = $mom->get_agenda_by_mom_id($id);
        return view('modules.mom.edit')
                ->with([
                    'title' => $title,
                    'DataMoM' => $DataMoM,
                    'DataType' => $DataType,
                    'DataParticipant' => $DataParticipant,
                    'DataAgenda' => $DataAgenda,
                    'MstType' => momType::get(), 
                    'users' => Users::get(),
                ]);
    }

    public function prnpriview()
      {
            $uic = UIC::all();
            return view('modules.mom.printview_uic')->with('uic', $uic);;
      }

}