@inject('Dashboard', 'App\Services\DashboardService')
    @php
        $dtMom = $Dashboard->get_mom_all();
        $dtAllMom = $dtMom->count();
        $dtOpenMom = $dtMom->where('mom_status', 'O')->count();
        $dtCloseMom = $dtMom->where('mom_status', 'C')->count();
    @endphp

<div class="row">
    <div class="col-sm-6 col-xl-3" style="cursor:pointer" onclick="extended_page('A')">
        <div class="card card-body bg-danger text-white has-bg-image">
            <div class="media">
                <div class="media-body">
                    <h3>All MoM</h3><br>
                    <h3 class="mb-0">{{$dtAllMom}}</h3>
                </div>

                <div class="ml-3 align-self-center">
                    <i class="icon-files-empty icon-4x opacity-75"></i>
                </div>
            </div>
        </div>
    </div>

    <div class="col-sm-6 col-xl-3" style="cursor:pointer" onclick="extended_page('O')">
        <div class="card card-body bg-danger text-white has-bg-image">
            <div class="media">
                <div class="media-body">
                    <h3>Open MoM</h3><br>
                    <h3 class="mb-0">{{$dtOpenMom}}</h3>
                </div>

                <div class="ml-3 align-self-center">
                    <i class="icon-copy4 icon-4x opacity-75"></i>
                </div>
            </div>
        </div>
    </div>

    <div class="col-sm-6 col-xl-3" style="cursor:pointer" onclick="extended_page('C')">
        <div class="card card-body bg-danger text-white has-bg-image">
            <div class="media">
                <div class="media-body">
                    <h3>Closed MoM</h3><br>
                    <h3 class="mb-0">{{$dtCloseMom}}</h3>
                </div>

                <div class="ml-3 align-self-center">
                    <i class="icon-file-check icon-4x opacity-75"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <h1 class="mb-0 font-weight-bold">{{ $title }}</h1>
        <div class="card">
            <div class="card-body">
                <table class="table table-hover table-xs">
                    <tbody >
                        @foreach ($uic as $dtu)
                            <tr onclick="extended_page_assignment({{$dtu->uic_id}}, 'A')">
                                <td width="50px">
                                        <h5 class="text-danger mb-1 font-weight-bold"> {{$dtu->uic_code}}</h5>
                                </td>
                                
                                <td>
                                    @php
                                        $dtAssignmentOpen = $DataAssignment->where('uic_id',  $dtu->uic_id)
                                                                           ->where('discuss_status', 'O')
                                                                           ->pluck('total_discuss_per_status')
                                                                           ->first();

                                        $dtAssignmentClose = $DataAssignment->where('uic_id',  $dtu->uic_id)
                                                                           ->where('discuss_status', 'C')
                                                                           ->pluck('total_discuss_per_status')
                                                                           ->first();

                                        if ($dtu->total_discuss_per_uic <> 0) {
                                            $dtProgressOpen  = (($dtAssignmentOpen == null) ? 0 : $dtAssignmentOpen) / $dtu->total_discuss_per_uic * 100;
                                            $dtProgressClose = (($dtAssignmentClose == null) ? 0 : $dtAssignmentClose) / $dtu->total_discuss_per_uic * 100;
                                        }else{
                                            $dtProgressOpen  = 0;
                                            $dtProgressClose = 0;
                                        }
                                        
                                    @endphp
                                    <div class="progress rounded-pill" style="cursor:pointer">
                                        <div class="progress-bar bg-teal" style="width: {{$dtProgressClose}}%">
                                            <span>{{round($dtProgressClose,0)}} %</span>
                                        </div>
                                        <div class="progress-bar bg-warning" style="width: {{$dtProgressOpen}}%">
                                            <span>{{round($dtProgressOpen,0)}} %</span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        @endforeach                         
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>