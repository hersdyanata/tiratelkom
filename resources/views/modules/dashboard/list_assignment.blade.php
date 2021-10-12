<div class="col-lg-12">
    <h1 class="mb-0 font-weight-bold">{{ $title }}</h1>
    <div class="card">
        <div class="card-body">
            <table class="table table-hover table-xs">
                <tbody >
                    @foreach ($uic as $dt_uic)
                        <tr onclick="extended_page({{$dt_uic->uic_id}})">
                            <td width="50px">
                                    <h5 class="text-danger mb-1 font-weight-bold"> {{$dt_uic->uic_code}}</h5>
                            </td>

                            <td>
                                <div class="progress rounded-pill" style="cursor:pointer">
                                    <div class="progress-bar bg-teal" style="width: 75%">
                                        <span>85%</span>
                                    </div>

                                    <div class="progress-bar bg-warning" style="width: 25%">
                                        <span>25%</span>
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