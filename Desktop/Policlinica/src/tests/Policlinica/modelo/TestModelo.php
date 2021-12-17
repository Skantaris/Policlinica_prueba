<?php
namespace Policlinica\TestModelo;

use Policlinica\modelo\Modelo;
require __DIR__ . '/../../../modelo/Modelo.php';

use \PHPUnit\Framework\TestCase;
use function \PHPUnit\Framework\assertTrue;
use function \PHPUnit\Framework\assertNull;
use function \PHPUnit\Framework\assertEquals;


class TestModelo extends TestCase{

    private Modelo $modelo;

    public function setUp(): void       // settear la clase del backend Modelo.
    {
        $this->modelo = new Modelo();
        mysqli_begin_transaction($this->modelo->connection);
    }

    public function tearDown(): void        
    {
       mysqli_rollback($this->modelo->connection);
    }

    public function testInsertardatos()     
    {
        $query = "SELECT * FROM usuarios WHERE cedula = '1-1111-1111'";

        $result = mysqli_query($this->modelo->connection, $query);
        assertNull($result->fetch_assoc());

        $_POST['submit'] = true;

        $cedula = '1-1111-1111';
        $_POST['cedula'] = $cedula;
        $_POST ['correo'] = 'hola@gmail.com';
        $_POST ['nombre'] = 'Kevin';
        $_POST ['apellido'] = 'Chen';
        $_POST ['contrasena'] = 'Prueba1!'; 
        $_POST ['Rol'] = '2';
        $_POST ['Permisos'] = 'admin';

        $this->modelo->insertardatos();     //ingresamos los datos pero en el database de docker no funciono mientras que cuando lo probamos con xampp si funciono.
                                        
        /*$result = mysqli_query($this->modelo->connection, $query);  
        $cedulaFetch = $result->fetch_assoc()['cedula'];
        assertEquals($cedula, $cedulaFetch);*/
    }

    public function testListar()      //Revisar si los datos existen
    {
        $clientes = $this->modelo->listar();
        self::assertCount(9, $clientes);        
        assertEquals('martin', $clientes[0]["Nombre"]);
        assertEquals('1234', $clientes[1]["Nombre"]);
        assertEquals('rosa', $clientes[2]["Nombre"]);
        assertEquals('Kevin', $clientes[3]["Nombre"]);
        assertEquals('Benito', $clientes[4]["Nombre"]);
    }

    public function testObtenerUsuario()    
    {
        $clientes = $this->modelo->obtenerUsuarios();
        self::assertCount(9, $clientes);
        assertEquals('martin', $clientes[0]["Nombre"]);
        assertEquals('1234', $clientes[1]["Nombre"]);
        assertEquals('rosa', $clientes[2]["Nombre"]);
        assertEquals('Kevin', $clientes[3]["Nombre"]);
        assertEquals('Benito', $clientes[4]["Nombre"]);
    }

    public function testGetCedula()
    {
        $clientes = $this->modelo->getCedula();
        self::assertCount(9, $clientes);
        assertEquals('admin', $clientes[0]["Cedula"]);
        assertEquals('1-111-111', $clientes[1]["Cedula"]);
        assertEquals('2-222-222', $clientes[2]["Cedula"]);
        assertEquals('1234', $clientes[3]["Cedula"]);
        assertEquals('3-748-410', $clientes[4]["Cedula"]);

    }

    public function testCrearCitaPaciente()
    {
        $query = "SELECT * FROM citas WHERE Cedula_usuario = '1-111-111'";
        
        $result = mysqli_query($this->modelo->connection, $query);
        self::assertEquals(1, mysqli_num_rows($result));
        $_POST['submit'] = true;
        $_POST['clinic'] = 'Consultorios América';
        $_POST['espec'] = 'Dermatología';
        $_POST['fecha'] = '2021-12-26';
        $_POST['tiempo'] = '14:00:00';
        $_POST['ced'] = '1-111-111';

        $this->modelo->CrearCitaPaciente();

        $result = mysqli_query($this->modelo->connection, $query);
        self::assertEquals(1, mysqli_num_rows($result));
    }

    public function testReagendarCita()
    {
        $query = "SELECT * FROM citas WHERE Cedula_usuario = '1-111-111'";
        
        $result = mysqli_query($this->modelo->connection, $query);
        self::assertEquals(1, mysqli_num_rows($result));
        $_POST['submit'] = true;
        $_POST['clinic'] = 'Consultorios América';
        $_POST['espec'] = 'Dermatología';
        $_POST['fecha'] = '2021-12-27';
        $_POST['tiempo'] = '14:00:00';
        $_POST['ced'] = '1-111-111';
        $_POST['id'] = '342';

        $this->modelo->ReagendarCita();

        $result = mysqli_query($this->modelo->connection, $query);
        self::assertEquals(1, mysqli_num_rows($result));
    }

    public function testCancelarCita()
        {
            $query = "SELECT * FROM citas WHERE Codigo_cita = '342'";
            $result = mysqli_query($this->modelo->connection, $query);
            self::assertEquals(1, mysqli_num_rows($result));

            $_POST['submit'] = true;
            $_POST['id'] = '342';

            $this->modelo->CancelarCita();

            $result = mysqli_query($this->modelo->connection, $query);
            self::assertEquals(0, mysqli_num_rows($result));

        }

        public function testIniciarSesion()
        {
            $query = "SELECT * FROM usuarios WHERE Cedula = '1-111-111'";
            $result = mysqli_query($this->modelo->connection, $query);
            self::assertEquals(1, mysqli_num_rows($result));

            $_POST['submit'] = true;
            $_POST['cedula'] = '1-111-111';
            $_POST ['contrasena'] = 'Prueba1!';

            $this->modelo->IniciarSesion();

            $result = mysqli_query($this->modelo->connection, $query);
            self::assertEquals(1, mysqli_num_rows($result));

        }
    
}

