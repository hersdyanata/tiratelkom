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
        <h1 class="mb-0 font-weight-bold">
            {{ $title }}
        </h1>
        <div class="card">
            <div class="card-body">
                <input type="hidden" id="status_mom" value="{{ $status }}" readonly> 
                  <ul class="nav nav-pills nav-pills-bordered nav-justified">
                    @foreach ($kategori as $k)
                        <li class="nav-item" {{ $visible }}>
                            <a href="#kategori{{ $k->category_id }}" class="nav-link rounded-left rounded-right {{ $k->category_default }}" data-toggle="tab" onclick="filter_mom('{{ $k->category_id }}')">
                                {{ $k->category_desc }} 
                                <span class="badge badge-danger badge-pill align-top ml-2 float-right">
                                    {{ $retVal = ($status == 'A') ? $dtMom->where('mom_title', $k->category_id)->count() : $dtMom->where('mom_title', $k->category_id)->where('mom_status', $status)->count();}}
                                </span>
                            </a>
                        </li>    
                    @endforeach
                </ul>
                <div class="tab-content">
                    @foreach ($kategori as $k)
                        <div class="tab-pane fade {{ ($k->category_default == 'active') ? 'show' : '' }} {{ $k->category_default }}" id="kategori{{ $k->category_id }}">
                            <div id="konten{{ $k->category_id }}"></div> 
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>

<script>        
    filter_mom('1');
    function filter_mom(kategori){
        $.ajax({
            type: "POST",
            url: "{{ route('dashboard.filter_mom') }}",
            data: {
                "_token": "{{ csrf_token() }}",
                "kategori_mom": kategori,
                "status_mom": $('#status_mom').val()
            },
            beforeSend: function(){
                big_loader_open('page');
            },
            success: function (s) {
                $('#konten'+kategori).html(s);   
            },
            complete: function(){
                big_loader_close('page');
            }
        });
    }

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