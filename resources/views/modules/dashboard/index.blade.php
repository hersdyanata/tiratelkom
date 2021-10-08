@extends('layouts.app')

@section('header')
    Dashboard
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-6">
            <div class="mb-3">
                <h1 class="mb-0 font-weight-bold">
                    Dashboard
                </h1>
                <span class="text-muted d-block">
                    MoM Progress
                </span>
            </div>
        </div>
        <div class="col-lg-3">
            <select class="form-control form-control-filled form-control-lg" name="order_by" id="order_by">
                <option value="">-- Bulan --</option>
            </select>
        </div>
        <div class="col-lg-3">
            <div class="form-group form-group-feedback form-group-feedback-left">
                <input type="text" class="form-control form-control-filled form-control-lg" placeholder="Search...">
                <div class="form-control-feedback form-control-feedback-sm">
                    <i class="icon-search4"></i>
                </div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-sm-6 col-xl-3" style="cursor:pointer" onclick="extended_page('A')">
            <div class="card card-body bg-danger text-white has-bg-image">
                <div class="media">
                    <div class="media-body">
                        <h3>All MoM</h3><br>
                        <h3 class="mb-0">389,438</h3>
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
                        <h3 class="mb-0">389,438</h3>
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
                        <h3 class="mb-0">389,438</h3>
                    </div>

                    <div class="ml-3 align-self-center">
                        <i class="icon-file-check icon-4x opacity-75"></i>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="row" id="page"></div>
@endsection

@section('page_js')
<script>
        extended_page('L');
        function extended_page(type_){
            $.ajax({
                type: "POST",
                url: "{{ route('dashboard.extended_page') }}",
                data: {
                    "_token": "{{ csrf_token() }}",
                    "type": type_
                },
                beforeSend: function(){
                    big_loader_open('page');
                },
                success: function (s) {
                    $('#page').html(s);
                },
                complete: function(){
                    big_loader_close('page');
                }
            });
        }
    </script>    
@endsection
