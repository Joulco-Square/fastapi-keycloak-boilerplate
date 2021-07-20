# Fastapi Keycloak Boilerplate

## Dependencies

- Keycloak
- MongoDB

## Set up keycloak

# Create realm
1) Hover over current realm name (sidebar) -> "Add realm"
    Fill in required fields and press save button.
    Set KEYCLOAK_REALM in env to entered "Name"

# Create realm admin
1) Open admin console and select realm of your choice (realm selection box on top left side).
2) Go to users (sidebar) -> add user (button on the right side)
    Fill in required fields and press save button.
    Set KEYCLOAK_USERNAME in env to entered "Username"
3) Open Credentials tab and set password.
    Deselect "Temporary" to set permenent password
    Fill in required fields and press save button.
    Set KEYCLOAK_PASSWORD in env to entered "Password"
4) Open Role Mapping tab:
    Select realm-management under Client Roles.
    Select all available roles and press Add selected.

# Create Client
2) Go to Clients (sidebar) -> create client (button on the right side)
    Fill in required fields and press save button.
    Set KEYCLOAK_CLIENT in env to entered "Client ID"

# Set up scope
1) Open admin console and select realm of your choice (realm selection box on top left side).
2) Go to Client Scopes (sidebar) -> "roles" -> edit
3) Mappers -> Create
    Enter Name for your mapper
    Select 'Audience' in "Mapper Type" dropdown
    Select your client in "Included Client Audience" dropdown
    Enable 'Add to ID Token'
    Enable 'Add to access token'


## Test in development environment

- Setup a virtual environment and install dependencies

    ```
    sudo apt install python3.8

    sudo pip3 install virtualenv

    python3 -m virtualenv venv

    source venv/bin/activate

    pip3 install -r requirements.txt
    ```
- Dependencies
  - Keycloak

    ```
    docker run -p 8080:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=password -d quay.io/keycloak/keycloak:14.0.0
    ```
  - MongoDB

    ```
    docker run --name mongo -d -p 27017:27017 -v $HOME/mongodb/data:/data/db mongo
    ```
- Start the server

    ```
    uvicorn app.main:app --reload
    ```

### Deploy into production

  - Make sure keycloak is connected to a mysql db
  - Refer to the given k8 configs to get to know how to deploy MySQL & Mongo persistant volumes with persistant volume claims
