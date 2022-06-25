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
        Schema::create('applications', function (Blueprint $table) {
            $table->id();
            $table->string('nom');
            $table->string('logo');
            $table->string('guide')->nullable('');
            $table->text('description');
            $table->text('condition');
            $table->string('fileApk');
            $table->string('packageName');
            $table->string('versionApk');
            $table->string('versionAndroid');
            $table->float('note')->nullable('');
            $table->integer('votants')->nullable('');
            $table->timestamps();

            $table->foreignId('categorie_id')->constrained();
            $table->foreignId('utilisateur_id')->constrained();
            $table->foreignId('capture_id')->constrained();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('applications');
    }
};
