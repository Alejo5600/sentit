<?php


namespace SentIt\Repositories;


use Illuminate\Database\Eloquent\ModelNotFoundException;

class EloquentRepository implements RepositoryInterface
{
    protected $model;

    public function all()
    {
        return $this->model->all();
    }

    public function create(array $data)
    {
        return $this->model->create($data);
    }

    public function update(array $data, $id)
    {
        return $this->model
            ->where($this->model->getKeyName(), $id)
            ->update($data);
    }

    public function delete(int $id)
    {
        return $this->model->destroy($id);
    }

    public function find(int $id)
    {
        return $this->model->find($id);
    }
}
