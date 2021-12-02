@inject('Dashboard', 'App\Services\DashboardService')
    @php
        $dtMom = $Dashboard->get_mom_by_uic($uic_id);
        $dtAllMom = $dtMom->count();
        $dtOpenMom = $dtMom->where('discuss_status', 'O')->count();
        $dtCloseMom = $dtMom->where('discuss_status', 'C')->count();

        if ($status == 'A') {
            $dataMom = $dtMom;
            $DueDate = $dtMom->pluck('discuss_due_date')
                             ->max();

            $dtPriority = $dtMom->pluck('discuss_priority')
                                ->max();
        } else {
            $dataMom = $dtMom->where('discuss_status', $status);

            $DueDate = $dtMom->where('discuss_status', $status) 
                           ->pluck('discuss_due_date')
                           ->max();
            
            $dtPriority = $dtMom->where('discuss_status', $status) 
                                ->pluck('discuss_priority')
                                ->max();            
        }     
        
        if ($dtPriority == '3') {
            $priority = '<span class="badge badge-danger">High</span>'; 
        }
        elseif($dtPriority == '2'){
            $priority = '<span class="badge badge-yellow">Normal</span>'; 
        }
        else{
            $priority = '<span class="badge badge-success">Low</span>'; 
        } 
    @endphp
    
<div class="row">
    <div class="col-sm-6 col-xl-3" style="cursor:pointer" onclick="extended_page_assignment({{$uic_id}}, 'A')">
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

    <div class="col-sm-6 col-xl-3" style="cursor:pointer" onclick="extended_page_assignment({{$uic_id}}, 'O')">
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

    <div class="col-sm-6 col-xl-3" style="cursor:pointer" onclick="extended_page_assignment({{$uic_id}}, 'C')">
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
        <h1 class="mb-0 font-weight-bold">
            {{ $title }}
        </h1>
        <div class="card">
            <div class="card-body">
                <input type="hidden" id="status_mom" value="{{ $uic_code }}" readonly>
                <div class="tab-content">
                    <table class="table table-bordered datatable-show-all table-hover" id="tableData">
                        <thead>
                            <tr>
                                <th>Nama MoM</th>
                                <th>Due Date</th>
                                <th>Priority</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody> 
                            @forelse ($dataMom as $m)
                                <tr onclick="view_mom_by_status('{{$m->mom_status}}', '{{$m->mom_id}}')" style="cursor:pointer">
                                    <td>{{ $m->mom_event }}</td>
                                    <td>{{ date("m/d/Y", strtotime($DueDate)) }}</td>
                                    <td>{!! $priority !!}</td>
                                    <td>{{ ($m->discuss_status == 'O') ? 'Open' : 'Close'}}</td> 
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="4" class="text-center">no data found</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>         
    function view_mom_by_status(status, id){
        if (status == 'O') {
            window.location.href = "{{ route('mom.edit_status_mom', ':x') }}".replace(':x',id); 
        }else{
            if (status == 'D') {
                window.location.href = "{{ route('mom.edit_mom', ':x') }}".replace(':x',id);
            } else {
                window.location.href = "{{ route('mom.print_mom', ':x') }}".replace(':x',id);
            }  
        }
    } 
</script>