<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * Tanggapan Entity
 *
 * @property int $id_tanggapan
 * @property int $id_pengaduan
 * @property \Cake\I18n\Date $tg_tanggapan
 * @property string $isi_laporan
 * @property int $id_petugas
 */
class Tanggapan extends Entity
{
    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * Note that when '*' is set to true, this allows all unspecified fields to
     * be mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove it), and explicitly make individual fields accessible as needed.
     *
     * @var array<string, bool>
     */
    protected array $_accessible = [
        'id_pengaduan' => true,
        'tg_tanggapan' => true,
        'isi_laporan' => true,
        'id_petugas' => true,
    ];
}
