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
        @forelse ($moms as $m)
            <tr>
                <td>{{ $m->mom_event }}</td>
                <td>{{ $m->getAttr_due_date_discuss()}}</td>
                <td>{{ $m->getAttr_priority_discuss()}}</td>
                <td>{{ $m->getAttr_status_discuss()}}</td>
            </tr>
        @empty
            <tr>
                <td colspan="4" class="text-center">no data found</td>
            </tr>
        @endforelse
    </tbody>
</table>
