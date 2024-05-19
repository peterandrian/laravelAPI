<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Symfony\Component\HttpKernel\Exception\HttpException;
use App\Models\Book;


class BookController extends Controller
{
    public function index()
    {
        return Book::get();
    }

    public function store(Request $request)
    {
        try{
            $book = new Book;
            $book->fill($request->validated())->save();

            return $book;
        } catch(\Exception $exception){
            throw new HttpExecption(400, "Invalid data - {$exception->getMessage}");
        }
    }

    public function destroy($id)
    {
        $book = Book::findOrfail($id);
        $book->delete();

        return response()->json(null,204);
    }
}
