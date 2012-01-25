<!-- File: /app/View/Organizaciones/view.ctp -->

<h1><?php echo $organizacion['Organizacion']['nombre']?></h1>

<p><small>Historia: <?php echo $organizacion['Organizacion']['descripcion']?></small></p>

<p>Web: <?php echo $organizacion['Organizacion']['web']?></p>
<table>
    <tr>
        <th>Fecha</th>
        <th>Destino</th>
        <th>Barrio</th>
        <th>Plata Necesaria</th>
    </tr>
    <?php foreach ($viajes as $viaje): ?>
    <tr>
        <td><?php echo $viaje['Viaje']['fecha']; ?></td>
        <td>
            <?php echo $this->Html->link($viaje['Viaje']['destino'],
array('controller' => 'viajes', 'action' => 'view', $viaje['Viaje']['id'])); ?>
        </td>
        <td><?php echo $viaje['Viaje']['barrio']; ?></td>
        <td><?php echo $viaje['Viaje']['plataNecesaria']; ?></td>
    </tr>
    <?php endforeach; ?>
</table>