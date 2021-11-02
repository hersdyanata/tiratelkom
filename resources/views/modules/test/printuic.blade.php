@extends('layouts.my')
@section('content')

<script type="text/javascript">

    $(document).ready(function(){
         $(".printPage").click(function(){
            window.print();
        });
    });
 

</script>



<center>
    <br><br>
    <a href="{{ route('prnpriview') }}" class="printPage btn">Print Preview</a>
    {{-- <a  class="printPage" href="#">Print</a> --}}
</center>

<center>
    <h1>UIC Lists</h1>
    <table class="table">
        <tr>
            <th>Id</th>
            <th>Code</th>
            <th>Desc</th> 
        </tr>
        @foreach($uic as $r)
        <tr>
            <td>{{ $r->uic_id }}</td>
            <td>{{ $r->uic_code }}</td>
            <td>{{ $r->uic_desc }}</td> 
        </tr>
        @endforeach
</center>

@endsection

