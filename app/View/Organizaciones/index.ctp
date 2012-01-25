<!-- File: /app/View/Organizaciones/index.ctp -->

<h1>Blog organizaciones</h1>
<?php echo $this->Html->link('Add Organizacion', array('controller' => 'organizaciones', 'action' => 'add')); ?>
<table>
    <tr>
        <th>Id</th>
        <th>Title</th>
        <th>Created</th>
    </tr>

    <!-- Here is where we loop through our $organizaciones array, printing out organizacion info -->

    <?php foreach ($organizaciones as $organizacion): ?>
    <tr>
        <td><?php echo $organizacion['Organizacion']['id']; ?></td>
        <td>
            <?php echo $this->Html->link($organizacion['Organizacion']['nombre'],
array('controller' => 'organizaciones', 'action' => 'view', $organizacion['Organizacion']['id'])); ?>

        </td>
		<td>
		        <?php echo $this->Form->postLink(
            'Delete',
            array('action' => 'delete', $organizacion['Organizacion']['id']),
            array('confirm' => 'Are you sure?'));
        ?>
		<?php echo $this->Html->link('Edit', array('action' => 'edit', $organizacion['Organizacion']['id']));?>
        </td>
        <td><?php echo $organizacion['Organizacion']['web']; ?></td>
    </tr>
    <?php endforeach; ?>

</table>