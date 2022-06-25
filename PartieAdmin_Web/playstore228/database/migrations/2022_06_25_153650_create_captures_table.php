<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('captures', function (Blueprint $table) {
            $table->id();
            $table->string('capture1');
            $table->string('capture2')->nullable('');
            $table->string('capture3')->nullable('');
            $table->string('capture4')->nullable('');
            $table->string('capture5')->nullable('');
            $table->string('capture6')->nullable('');
            $table->string('capture7')->nullable('');
            $table->string('capture8')->nullable('');
            $table->timestamps();
            
            $table->foreignId('application_id')->constrained();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('captures');
    }
};
