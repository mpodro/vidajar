<?php
App::import('model','Viaje');
class OrganizacionesController extends AppController {
	public $helpers = array ('Html','Form');

	function index() {
		/*
		 $options['joins'] = array(
		 array('table' => 'viajes',
		 'alias' => 'v',
		 'type' => 'LEFT',
		 'conditions' => array(
		 'v.idOrganizacion = Organizacion.id',
		 )
		 )
		 );

		$this->set('organizacion', $this->Organizacion->find('all', $options));
		 */
		$this->set('organizaciones', $this->Organizacion->find('all'));
	}

	public function view($id = null) {
		$this->Organizacion->id = $id;
		$this->set('organizacion', $this->Organizacion->read());
		
		 $options['conditions'] = array(
		 array('idOrganizacion' => $id)
		 );

		$viaje = new Viaje();
		$this->set('viajes', $viaje->find('all', $options));

	}

	public function add() {
		if ($this->request->is('organizacion')) {
			if ($this->Organizacion->save($this->request->data)) {
				$this->Session->setFlash('Your post has been saved.');
				$this->redirect(array('action' => 'index'));
			}
		}
	}

	function edit($id = null) {
		$this->Organizacion->id = $id;
		if ($this->request->is('get')) {
			$this->request->data = $this->Organizacion->read();
		} else {
			if ($this->Organizacion->save($this->request->data)) {
				$this->Session->setFlash('Your post has been updated.');
				$this->redirect(array('action' => 'index'));
			}
		}
	}

	function delete($id) {
		if (!$this->request->is('organizacion')) {
			throw new MethodNotAllowedException();
		}
		if ($this->Organizacion->delete($id)) {
			$this->Session->setFlash('The post with id: ' . $id . ' has been deleted.');
			$this->redirect(array('action' => 'index'));
		}
	}
}
?>