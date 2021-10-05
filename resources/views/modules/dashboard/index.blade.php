@extends('layouts.app')

@section('header')
    Dashboard
@endsection

@section('content')
    <div class="row">
        <div class="col-sm-6 col-xl-3" style="cursor:pointer">
            <div class="card card-body has-bg-image">
                <div class="media">
                    <div class="media-body">
                        <h3>List Assignment Unit</h3><br>
                        <h3 class="mb-0">389,438</h3>
                    </div>

                    <div class="ml-3 align-self-center">
                        <i class="icon-file-text2 text-success icon-4x opacity-75"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-xl-3" style="cursor:pointer">
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

        <div class="col-sm-6 col-xl-3" style="cursor:pointer">
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

        <div class="col-sm-6 col-xl-3" style="cursor:pointer">
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

    <div class="row">
        <div class="col-xl-12">
            <div class="card" id="section_divider">
                <div class="card-header header-elements-inline">
                    <h5 class="card-title">{{ $title }}</h5>
                </div>

                <div class="card-body">
                    
                </div>
            </div>
        </div>
    </div>
@endsection

@section('page_js')
    <script>
        
    </script>    
@endsection
