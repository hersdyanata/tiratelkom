@extends('layouts.app')

@section('header')
    Preview UIC
@endsection

@section('content')
    <!-- Main charts -->
     Preview UIC List
    <!-- /main charts -->

@endsection

@section('page_resources')
    <center>
        <h1>UIC Information List </h1>
        <table class="table">
            <tr>
                <th>Id</th>
                <th>Code</th>
                <th>Desc</th> 
            </tr>
            @foreach($uic as $r)
            <tr>
                <td>{{ $r->id }}</td>
                <td>{{ $r->uic_code }}</td>
                <td>{{ $r->uic_desc }}</td> 
            </tr>
            @endforeach
    </center>
@endsection

@section('page_js')
    <script>
        
    </script>    
@endsection
