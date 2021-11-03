@extends('layouts.my')
@section('content')
{{-- 
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
<a class="printPage" href="#">Print</a>
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
</center> --}}

<style> 
    table{
        color: rgb(0, 0, 0)!important;
        font-family: arial;
        font-size: 12px;
        border-collapse: collapse;
        width: 100%;
        height: 182px; 
    }

    table, th, td { 
        border: 1px solid rgb(0, 0, 0)!important;
    }

    p {
        font-size: 14px;
        color: rgb(255, 255, 255);
        font-family: arial;
        font-weight: bold;
        text-align: center;
        vertical-align : middle;
    } 

    td{
        height: 10px;
        vertical-align : middle;
        padding: 5px;
    }

    #tdStyle{ 
        background: #E74C3C; 
        color:#FFF;
        text-align: center;
        font-weight: bold;
    }

</style>

<table>
    <tbody>
        <tr>
            <td id="tdStyle" style="width: 45.9279%;" colspan="2">
                <p>MINUTES OF MEETING</p> 
                <p>Manajemen Review IMS</p> 
            </td>
            <td style="text-align: center;" rowspan="4">Images</td>
        </tr>
        <tr>
            <td style="width: 11.5%;"><strong>Date</strong></td>
            <td>&nbsp;......................</td>
        </tr>
        <tr>
            <td><strong>Time</strong></td>
            <td>&nbsp;......................</td>
        </tr>
        <tr>
            <td><strong>Media</strong></td>
            <td>&nbsp;......................</td>
        </tr>
        <tr>
            <td colspan="3">Meeting Called by : &nbsp;......................</td>
        </tr> 
        <tr>
            <td colspan="3">Type of Meeting : 
                <input type="checkbox" value="test" id="1" name="1"> 
                <input type="checkbox" value="test" id="1" name="1"> 
                <input type="checkbox" value="test" id="1" name="1"> 
                <input type="checkbox" value="test" id="1" name="1"> 
            </td>
        </tr>
        <tr>
            <td colspan="3">Attendees :
                <ol style="list-style-type: lower-alpha;">
                    <li>...........</li>
                    <li>...........</li>
                    <li>...........</li>
                </ol>
            </td>
        </tr>
        <tr>
            <td id="tdStyle" colspan="3">Agenda</td>
        </tr>
        <tr>
            <td colspan="3">
                <ol style="list-style-type: lower-alpha;">
                    <li>...........</li>
                    <li>...........</li>
                    <li>...........</li>
                </ol>
            </td>
        </tr>
        <tr>
            <td id="tdStyle" colspan="3"> Discussion</td>
        </tr>
        <tr>
            <td colspan="3">
                <ol>
                    <li>..........</li>
                    <li>..........</li>
                    <li>..........</li>
                </ol>
            </td>
        </tr>
    </tbody>
</table>

@endsection
