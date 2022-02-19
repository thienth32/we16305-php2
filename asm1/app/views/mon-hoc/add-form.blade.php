@extends('layouts.main')
@section('main-content')
<form action="" method="post">
    <div class="col-6 offset-3">
        <div class="card">
            <div class="card-header">
                <h4>Tạo mới môn học</h4>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <label for="">Tên danh mục</label>
                    <input type="text" class="form-control" name="name">
                </div>
                <div>
                    <button class="btn btn-primary" type="submit">Lưu</button>
                </div>
            </div>
        </div>
    </div>
    
</form>
@endsection
@section('page-script')
<script>
    $('button').click(function(){
        console.log(1);
    });
</script>
@endsection