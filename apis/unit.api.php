<?php 
function im_json_api_default_filters( $server ) {
    
	global $unit_api;

    $unit_api = new Unit_API( $server);

    add_filter( 'json_endpoints', array( $unit_api, 'register_routes' ) );

}
add_action( 'wp_json_server_before_serve', 'im_json_api_default_filters', 12, 1 );


class Unit_API 
{
	public function register_routes( $routes ) {
        $routes['/units/(?P<id>\d+)'] = array(
            array( array( $this, 'create_order'), WP_JSON_Server::CREATABLE)
                        
        );
        $routes['/unitstatus/(?P<id>\d+)'] = array(
            array( array( $this, 'change_status'), WP_JSON_Server::CREATABLE)
                        
        );
        



        



        return $routes;
    }

    public function create_order($id){


        $array = array(

            'id'            => $id,
            'first_name'    => $_REQUEST['first_name'],
            'last_name'     => $_REQUEST['last_name'],
            'email'         => $_REQUEST['email'],
            'phone'         => $_REQUEST['phone'],
            'birthdate'     => $_REQUEST['birthdate'],
            'nationality'   => $_REQUEST['nationality'],
            'address'       => $_REQUEST['address'],
            'city'          => $_REQUEST['city'],
            'state'         => $_REQUEST['state'],
            'zipcode'       => $_REQUEST['zipcode'],
            'country'       => $_REQUEST['zipcode'],
            'user_id'       => $_REQUEST['user_id']



            );

        $response = create_order($array);

        if(is_wp_error($response)){
            $response = new WP_JSON_Response( $response );
            $response->set_status(404);

        }
        else
        {
            if ( ! ( $response instanceof WP_JSON_ResponseInterface ) ) {
             $response = new WP_JSON_Response( $response );
            }
            $response->set_status( 200 );
        }

        return $response;


    }

    public function change_status($id){


        $user_id = $_REQUEST['user_id'];
        $response = change_status($id,110,$user_id);

        if(is_wp_error($response)){
            $response = new WP_JSON_Response( $response );
            $response->set_status(404);

        }
        else
        {
            if ( ! ( $response instanceof WP_JSON_ResponseInterface ) ) {
             $response = new WP_JSON_Response( $response );
            }
            $response->set_status( 200 );
        }

        return $response;



    }

}