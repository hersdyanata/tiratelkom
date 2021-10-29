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
                <td>test</td>
                <td>test</td>
                <td>test</td>
            </tr>
        @empty
            <tr>
                <td colspan="4" class="text-center">no data found</td>
            </tr>
        @endforelse
    </tbody>
</table>
