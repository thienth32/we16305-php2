@extends('layouts.main')
@section('main-content')
    
<table class="table table-hover">
    <thead>
        <th>Mã môn</th>
        <th>Tên môn</th>
        <th>
            <a href="{{BASE_URL . 'mon-hoc/tao-moi' }}">Tạo mới</a>
        </th>
    </thead>
    <tbody>
        @foreach ($monhoc as $sub)
            <tr>
                <td>{{$sub->id}}</td>
                <td>
                    <a href="{{BASE_URL . 'quiz?subjectId=' . $sub->id}}">{{$sub->name}}</a>
                </td>
                <td>
                    <a href="{{BASE_URL . 'mon-hoc/cap-nhat/' . $sub->id}}">Sửa</a>
                    <a href="{{BASE_URL . 'mon-hoc/xoa/' . $sub->id}}">Xóa</a>
                </td>
            </tr>
        @endforeach
    </tbody>
</table>
@endsection