<?php
declare(strict_types=1);

namespace App\Test\Fixture;

use Cake\TestSuite\Fixture\TestFixture;

/**
 * TanggapanFixture
 */
class TanggapanFixture extends TestFixture
{
    /**
     * Table name
     *
     * @var string
     */
    public string $table = 'tanggapan';
    /**
     * Init method
     *
     * @return void
     */
    public function init(): void
    {
        $this->records = [
            [
                'id_tanggapan' => 1,
                'id_pengaduan' => 1,
                'tg_tanggapan' => '2024-03-20',
                'isi_laporan' => 'Lorem ipsum dolor sit amet',
                'id_petugas' => 1,
            ],
        ];
        parent::init();
    }
}
