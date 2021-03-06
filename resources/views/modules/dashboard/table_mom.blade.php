<table class="table table-bordered datatable-show-all table-hover" id="tableData">
    <thead>
        <tr>
            <th>Nama MoM</th>
            <th>Created</th>
            <th>Priority</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        @forelse ($moms as $m)
        
            <tr onclick="view_mom_by_status('{{$m->mom_status}}', '{{$m->mom_id}}')" style="cursor:pointer">
                <td>{{ $m->mom_event }}</td>
                <td>{{ date("d F Y", strtotime($m->mom_created_date)) }}</td>
                <td>{!! $m->getAttr_priority_discuss() !!}</td>
                <td>{{ $m->getAttr_status_discuss()}}</td> 
            </tr>
        @empty
            <tr>
                <td colspan="4" class="text-center">no data found</td>
            </tr>
        @endforelse
    </tbody>
</table>
