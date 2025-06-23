echo "***setenv.bat running ..."

export MY_PASSWORD="test123"
export JWT_SECRET="test123"
export JWT_ACCESS_SECRET="access2TeachUA"
export JWT_REFRESH_SECRET="refresh2TeachUA"
export JWT_ACCESS_SECRET_KEY="4A404D635166546A576E5A7234753778214125442A472D4B6150645267556B58703273357638792F423F4528482B4D6251655468566D597133743677397A2443"
export JWT_REFRESH_SECRET_KEY="482B4D6251655468566D597133743677397A24432646294A404E635266556A586E5A7234753778214125442A472D4B6150645367566B59703373357638792F42"


#### Add
#export DRIVER_CLASS_NAME="org.postgresql.Driver"
#export HIBERNATE_DDL="create"
#export HIBERNATE_DIALECT="org.hibernate.dialect.PostgreSQL9Dialect"
#export SHOW_SQL="true"

#export PUBLIC_KEY=sandbox_i96549488438
#facebook
export PRIVATE_KEY="sandbox_p6nzimBma81AJ0ynQBx7LAjcZSXoTe5zqHjxyfJ2"
##set export GOOGLE_MAP_KEY=AIzaSyBdEOt1rGu5B5h5-wpS4WnTA5gD7-O6R30
export GOOGLE_MAP_KEY="<set-in-env>"

export BASE_URI="/dev"
export PROD_BASE_URI="/"


#export DEV2_DATASOURCE_URL=jdbc:postgresql://localhost:5432/teachua43
#export DEV2_DATASOURCE_USER=postgres
#export DEV2_DATASOURCE_PASSWORD=root

#export DEV2_DATASOURCE_URL=jdbc:postgresql://185.156.43.101:5432/su_test
#export DEV2_DATASOURCE_USER=su_teachua_dev
#export DEV2_DATASOURCE_PASSWORD=q9M2jok12JPo3k9kvl1

# Database conf (from Terraform)
# To update database config, run: ./scripts/update-database-config.sh
if [ -f "./database-config.env" ]; then
    source "./database-config.env"
    echo "Database config loaded from database-config.env"
else
    # Fallback to manual configuration
    echo "Using fallback database configuration. Run ./scripts/update-database-config.sh to sync with Terraform"
    export DEV2_DATASOURCE_URL="jdbc:postgresql://104.198.44.61:5432/teachua"
    export DEV2_DATASOURCE_USER="teachua_user"
    export DEV2_DATASOURCE_PASSWORD="TeachUA2024!secure"
    
    export PROD_DATASOURCE_URL="jdbc:postgresql://104.198.44.61:5432/teachua"
    export PROD_DATASOURCE_USER="teachua_user"
    export PROD_DATASOURCE_PASSWORD="TeachUA2024!secure"
fi


#export PROD_DATASOURCE_URL="jdbc:postgresql://speak-ukrainian.org.ua:5432/su_dev_2"
#export PROD_DATASOURCE_USER="su_dev_user_2"
#export PROD_DATASOURCE_PASSWORD="jKsUjkfj822jUo01o31"


#export TEST_DATASOURCE_URL=jdbc:postgresql://localhost:5432/su_dev
#export TEST_DATASOURCE_USER=su_dev_user
#export TEST_DATASOURCE_PASSWORD=jKsUjM7ks82jUoNq231

export PUBLIC_URL="/"
export PROD_PUBLIC_URL="/"
#export PROD_PUBLIC_URL=""
#export ROOT_SERVER="https://speak-ukrainian.com.ua"
export UPLOAD_PATH="target/upload"
#export UPLOAD_PATH=/opt/tomcat/latest/bin/target/upload

export STATIC_FOLDER="frontend"
export BASE_URL="http://localhost:8080/dev"
export PROD_BASE_URL="http://localhost:8080"
#export BASE_URL="https://speak-ukrainian.org.ua/dev"
#export PROD_BASE_URL="https://speak-ukrainian.org.ua"


#ROOT_SERVER=
#export USER_EMAIL=speakukrainiantest@gmail.com
#export USER_PASSWORD=teachua2021
export USER_EMAIL="speak.ukrainian.org.ua@gmail.com"
export USER_PASSWORD="rNdkO345!CaBVN1"
#export SEND_PASSWORD=nutbfpeopcriemso
export SEND_PASSWORD="<set-in-env>"
export URL_LOGS="./target/logs/"
#export URL_LOGS="/opt/tomcat/latest/logs"

#export OAUTH2_GOOGLE_CLIENT_ID=719863407108-293ckbk2ecskrfnqb19ll156ks1rmtgs.apps.googleusercontent.com
#export OAUTH2_GOOGLE_CLIENT_SECRET=snQqRHMBhuTo0CB2cXjQHZaS
export OAUTH2_GOOGLE_CLIENT_ID="<set-in-env>"
export OAUTH2_GOOGLE_CLIENT_SECRET="<set-in-env>"
export OAUTH2_FACEBOOK_CLIENT_ID="<set-in-env>"
export OAUTH2_FACEBOOK_CLIENT_SECRET="<set-in-env>"


#export DATASOURCE_URL=jdbc:postgresql://localhost:5432/teachua
#export DATASOURCE_URL=jdbc:postgresql://localhost:5432/teachuafirst
## set DATASOURCE_URL=jdbc:postgresql://localhost:5432/teachua33
#?serverTimezone=UTC
## set DATASOURCE_USER=postgres
## set DATASOURCE_PASSWORD=root
export DATASOURCE_URL="jdbc:postgresql://localhost:5432/teachua"
export DATASOURCE_USER="pmp2025"
export DATASOURCE_PASSWORD="Pmp#2025"

export SERVICE_ACCOUNT_CLIENT_EMAIL="speak-ukrainian@speak-ukrainian-362008.iam.gserviceaccount.com"
export SERVICE_ACCOUNT_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCLF3l+rUwf1STb\nISicYDMQL4RwIc49ghH5UuN065IJwYbw8jF2VDZCa+dKiRDK7igKJwRtlxtd08zi\nCbX/anLTGPimSjOJPcV0h+1g1xrmrjQEDjq7PU6QNbGSMJW/DMk3joHh2iX1B6ph\ns0k9zltDQSmBmviY+fw2VtnovU2aMxvkdHX/n0t+AJcAkjRIL1E+lk5fE1+TNqbJ\nMCpDMQWbNi+9WOurnCs6S6LzF/T0UThhwHCvIU7Uvj9R7/h6L+Yo5JsvWBfqJdv9\nKagulg9fK8ufTAa2aKA4TOFA2P10/xFfHGf2laGsnkvyYMa9m6sRBwQb9r6Wg5Xr\nyxdFhbQlAgMBAAECggEAAkn4G2ARtSJmUV7Z0rz4iicmCExeHwABeLdm+9kWlaeE\nJ3ns23QmUnCBJWZdCuHhcc1TktQeRKyEHiInxxTC3/t0uBPXhkYodjL4cpQHos0y\nGPD9AXDQVqozimLXTAYTV6E2PPfAkSg3oxT2uxgmw1QSsUnSFn5iqqhCPMTEvqlb\ncalryfR/DKmhnlKBLVjwlycnvZMTbi4E0hmsUYWd4bsnS4xAnSE99+2c0JTJa28I\na/INptaah64FsuqhlZkJRVHuN9AhfCM6FVRbbwg16oRqakU+FhI9lhf3Fj3ibtdg\nfqD9PxhBrRfAoU6aFUMgXUuWn82hLzpeuY6HFNZf8QKBgQC+Le9VIr0yTvXJwQgJ\nb/z0iJsv+FUT594y0P4I1f4I9wcIpkLWTQrY5/14L8zNX0Tn0U93o8vgX2dpTuub\npRfYo3xXB1+VKHvIltmlcM4h2Gw7Ae2HXV8tvkkbWc6gLWZekRj56+Ytxp16ruB2\nmIYPRqJ9xId0ZjEXIGp9KX1x6QKBgQC7Ox8SiBNZ1BZ8FG2u+WZ6mNherFXaYnxp\n+MprrRDyluIe+M+MFKmCd28adQ6gOxjt8Ye8qQDXbQTaxg3bacaMbYEP4K2NBKuQ\n9AjbXWA1/ODP8oveVrRQVc3ZFIDE1i4o5K+M4SU9sifPtOhORzcqd3G3vVLPB3tz\nxjbK656u3QKBgGqWnivuI3Hd1V31ZUa80F5RbgDtwuk8LEn43lgfb5igsv2DCbTI\nS0sUgvhoefWk7p6qrkpUsECZ2ACqrdx3JC1UO60fQc/8d5wOB//0gGNxw/8ybmlO\nyLh/jMPairc1mslns0LnlwOS7NJEzyNJCuHm6c1pZ62yVNMsZOKvbVJ5AoGAL4KD\nEfrBnku5IOc2Je5XWMisLungJzhShbmB8+zIniY3XtCYKd2cXeTcpoQJoBMe8lIV\ntYPVGNUrJDCZl5GxtjSbSWIj5+LFflTOYovBPDHdAidz4olx2+jKAUm4mzoWIH5X\nJZKEFrG8dHJdeG+NyhLhIlTCTJKDew9THA7KB2kCgYEAjXITcPn0yst87x8NUEmB\ntLNkgrehC8XvayvZ/VcJkxAcpfLlx5BeKXFSQ58Vqr3gfM+dqsPn1K+dwC1KhGSr\naorCd0mfeM91as72hQ0RKJsOaCH5BpgX0ogr1GKqL/cSVwmvPbcNBD6fwB4gGxR7\nTdu065ULlyiXwQ1kyeoUodw=\n-----END PRIVATE KEY-----\n"


echo "***MY_PASSWORD=$MY_PASSWORD"
echo "***PROD_PUBLIC_URL=$PROD_PUBLIC_URL"
echo "***STATIC_FOLDER=$STATIC_FOLDER"
echo "***DEV2_DATASOURCE_URL=$DEV2_DATASOURCE_URL"
echo "***JAVA_HOME=$JAVA_HOME"
echo "***JAVA_OPTS=$JAVA_OPTS"
echo "***JDK_JAVA_OPTIONS=$JDK_JAVA_OPTIONS"
