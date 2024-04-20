<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Query\SelectQuery;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * Tanggapan Model
 *
 * @method \App\Model\Entity\Tanggapan newEmptyEntity()
 * @method \App\Model\Entity\Tanggapan newEntity(array $data, array $options = [])
 * @method array<\App\Model\Entity\Tanggapan> newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\Tanggapan get(mixed $primaryKey, array|string $finder = 'all', \Psr\SimpleCache\CacheInterface|string|null $cache = null, \Closure|string|null $cacheKey = null, mixed ...$args)
 * @method \App\Model\Entity\Tanggapan findOrCreate($search, ?callable $callback = null, array $options = [])
 * @method \App\Model\Entity\Tanggapan patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method array<\App\Model\Entity\Tanggapan> patchEntities(iterable $entities, array $data, array $options = [])
 * @method \App\Model\Entity\Tanggapan|false save(\Cake\Datasource\EntityInterface $entity, array $options = [])
 * @method \App\Model\Entity\Tanggapan saveOrFail(\Cake\Datasource\EntityInterface $entity, array $options = [])
 * @method iterable<\App\Model\Entity\Tanggapan>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\Tanggapan>|false saveMany(iterable $entities, array $options = [])
 * @method iterable<\App\Model\Entity\Tanggapan>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\Tanggapan> saveManyOrFail(iterable $entities, array $options = [])
 * @method iterable<\App\Model\Entity\Tanggapan>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\Tanggapan>|false deleteMany(iterable $entities, array $options = [])
 * @method iterable<\App\Model\Entity\Tanggapan>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\Tanggapan> deleteManyOrFail(iterable $entities, array $options = [])
 */
class TanggapanTable extends Table
{
    /**
     * Initialize method
     *
     * @param array<string, mixed> $config The configuration for the Table.
     * @return void
     */
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('tanggapan');
        $this->setDisplayField('isi_laporan');
        $this->setPrimaryKey('id');

        $this->belongsTo('Pengaduan', [
            'foreignKey' => 'id_pengaduan',
            'joinType' => 'INNER',
        ]);
        $this->belongsTo('Petugas', [
            'foreignKey' => 'id_petugas',
            'joinType' => 'INNER',
        ]);

    }

    /**
     * Default validation rules.
     *
     * @param \Cake\Validation\Validator $validator Validator instance.
     * @return \Cake\Validation\Validator
     */
    public function validationDefault(Validator $validator): Validator
    {
        $validator
            ->integer('id_pengaduan')
            ->requirePresence('id_pengaduan', 'create')
            ->notEmptyString('id_pengaduan');

        $validator
            ->date('tg_tanggapan')
            ->requirePresence('tg_tanggapan', 'create')
            ->notEmptyDate('tg_tanggapan');

        $validator
            ->scalar('isi_laporan')
            ->maxLength('isi_laporan', 1000)
            ->requirePresence('isi_laporan', 'create')
            ->notEmptyString('isi_laporan');

        $validator
            ->integer('id_petugas')
            ->requirePresence('id_petugas', 'create')
            ->notEmptyString('id_petugas');

        return $validator;
    }
}
