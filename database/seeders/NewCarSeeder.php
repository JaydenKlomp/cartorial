<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class NewCarSeeder extends Seeder
{
    public function run()
    {
        DB::table('cars')->truncate();

        DB::table('cars')->insert([
            ['brand' => 'Tesla', 'model' => 'Model 3', 'year' => 2023, 'color' => 'Black'],
            ['brand' => 'Tesla', 'model' => 'Cybertruck', 'year' => 2024, 'color' => 'Silver'],
            ['brand' => 'BMW', 'model' => 'i8', 'year' => 2022, 'color' => 'Blue'],
            ['brand' => 'BMW', 'model' => 'M5', 'year' => 2021, 'color' => 'Red'],
            ['brand' => 'Mercedes', 'model' => 'E-Class', 'year' => 2023, 'color' => 'White'],
            ['brand' => 'Toyota', 'model' => 'Supra', 'year' => 2020, 'color' => 'Yellow'],
            ['brand' => 'Audi', 'model' => 'R8', 'year' => 2023, 'color' => 'Black'],
            ['brand' => 'Audi', 'model' => 'Q7', 'year' => 2021, 'color' => 'Gray'],
        ]);
    }
}
