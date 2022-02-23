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
    <div id="page"></div>
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

        function extended_page_assignment(id, type_){
            $.ajax({
                type: "POST",
                url: "{{ route('dashboard.extended_page_assignment') }}",
                data: {
                    "_token": "{{ csrf_token() }}",
                    "uic_id" : id,
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
