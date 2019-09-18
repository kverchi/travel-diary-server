PGDMP     4    :                w           diary    9.6.3    11.2 &    d	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            e	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            f	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            g	           1262    34995    diary    DATABASE     �   CREATE DATABASE diary WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Czech_Czech Republic.1250' LC_CTYPE = 'Czech_Czech Republic.1250';
    DROP DATABASE diary;
             postgres    false            @	          0    34997    author_type 
   TABLE DATA               :   COPY public.author_type (type_id, type_descr) FROM stdin;
    public       postgres    false    186   2!       B	          0    35002    authors 
   TABLE DATA               @   COPY public.authors (auth_id, auth_type, auth_name) FROM stdin;
    public       postgres    false    188   r!       D	          0    35007    books 
   TABLE DATA               Y   COPY public.books (book_id, book_title, author, book_description, published) FROM stdin;
    public       postgres    false    190   �!       F	          0    35015    comments 
   TABLE DATA               R   COPY public.comments (comment_id, created_at, text, post_id, user_id) FROM stdin;
    public       postgres    false    192   �%       H	          0    35021    conversations 
   TABLE DATA               L   COPY public.conversations (conversation_id, user_id1, user_id2) FROM stdin;
    public       postgres    false    194   �&       J	          0    35026 	   countries 
   TABLE DATA               I   COPY public.countries (country_code, country_name, img_path) FROM stdin;
    public       postgres    false    196   �&       M	          0    35041    messages 
   TABLE DATA               h   COPY public.messages (message_id, sender_id, conversation_id, sent_datetime, text, is_read) FROM stdin;
    public       postgres    false    199   v'       \	          0    35237    oauth_client_credentials 
   TABLE DATA               �   COPY public.oauth_client_credentials (access_token, oauth_client_id, oauth_secret, refresh_token, token_url, token_expires, credentials_email, is_refresh_token_valid, credentials_id) FROM stdin;
    public       postgres    false    214   �'       O	          0    35051    password_change_requests 
   TABLE DATA               [   COPY public.password_change_requests (uuid, user_id, created_time, isuuidused) FROM stdin;
    public       postgres    false    201   Z)       P	          0    35055    posts 
   TABLE DATA               �   COPY public.posts (post_id, title, text, description, sight_id, user_id, created_at, updated_at, preview_image_url) FROM stdin;
    public       postgres    false    202   w)       R	          0    35065    roles 
   TABLE DATA               .   COPY public.roles (role_id, role) FROM stdin;
    public       postgres    false    204   f>       T	          0    35070    sight_visits 
   TABLE DATA               O   COPY public.sight_visits (visit_id, sight_id, user_id, visited_at) FROM stdin;
    public       postgres    false    206   �>       `	          0    37834    sight_visits_counter 
   TABLE DATA               A   COPY public.sight_visits_counter (sight_id, counter) FROM stdin;
    public       postgres    false    218   ?       V	          0    35076    sight_wishes 
   TABLE DATA               M   COPY public.sight_wishes (wish_id, sight_id, user_id, wished_at) FROM stdin;
    public       postgres    false    208   >?       a	          0    37849    sight_wishes_counter 
   TABLE DATA               A   COPY public.sight_wishes_counter (sight_id, counter) FROM stdin;
    public       postgres    false    219   �?       K	          0    35031    sights 
   TABLE DATA               j   COPY public.sights (sight_id, label, country_code, img_url, description, latitude, longitude) FROM stdin;
    public       postgres    false    197   �?       W	          0    35080    user_activity_log 
   TABLE DATA               �   COPY public.user_activity_log (user_id, login_time, login_ip, user_hostname, session_id, active_session, os, browser, user_agent) FROM stdin;
    public       postgres    false    209   �B       X	          0    35088 
   user_roles 
   TABLE DATA               6   COPY public.user_roles (user_id, role_id) FROM stdin;
    public       postgres    false    210   �C       Y	          0    35091    users 
   TABLE DATA               o   COPY public.users (user_id, username, password, email, is_enabled, information, registration_date) FROM stdin;
    public       postgres    false    211   D       _	          0    36604    verification_tokens 
   TABLE DATA               b   COPY public.verification_tokens (token_id, token, user_id, expiration_date, is_valid) FROM stdin;
    public       postgres    false    217   ME       w	           0    0    author_type_type_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.author_type_type_id_seq', 4, true);
            public       postgres    false    187            x	           0    0    authors_auth_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.authors_auth_id_seq', 5, true);
            public       postgres    false    189            y	           0    0    books_book_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.books_book_id_seq', 28, true);
            public       postgres    false    191            z	           0    0    comments_comment_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.comments_comment_id_seq', 12, true);
            public       postgres    false    193            {	           0    0 !   conversations_conversation_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.conversations_conversation_id_seq', 5, true);
            public       postgres    false    195            |	           0    0    messages_message_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.messages_message_id_seq', 12, true);
            public       postgres    false    200            }	           0    0 +   oauth_client_credentials_credentials_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.oauth_client_credentials_credentials_id_seq', 1, true);
            public       postgres    false    215            ~	           0    0    posts_post_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.posts_post_id_seq', 51, true);
            public       postgres    false    203            	           0    0    roles_role_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.roles_role_id_seq', 1, false);
            public       postgres    false    205            �	           0    0 !   sight_visits_counter_visit_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.sight_visits_counter_visit_id_seq', 53, true);
            public       postgres    false    207            �	           0    0    sights_sight_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.sights_sight_id_seq', 43, true);
            public       postgres    false    198            �	           0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 41, true);
            public       postgres    false    212            �	           0    0     verification_tokens_token_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.verification_tokens_token_id_seq', 1, false);
            public       postgres    false    216            �	           0    0    wishes_counter_wish_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.wishes_counter_wish_id_seq', 12, true);
            public       postgres    false    213            @	   0   x�3�,/�,I-�2�,(�O)M2�9��s�LΤļ�=... .�      B	   V   x�3�4��H�O�/JUp)J�,N-�2
:�'�d$*8ge�d�r� �22s2��\2���L�BA��
NE�)I�E�\1z\\\ ���      D	     x���jG�ϣ�(|�E���>Œ��(Y�|����i��{�ݣ���7�!�������Q�^��M.�XY�0��k~�}�3��μ6nڑ+�P��B+�Y%�p������G�?5�E�:�CLD�WX��}�vFf*�:K�ܼ?w�X�9�]!F
�2�v��l��ֽ���@g]�]?��I�)fݹ�@���(T�@�'��l����V8@�ʷMk\�)�)7�X�����tK�qs����X����h��9�gm?;n}���ұ�`����~s�L9V�'�2G�b��%�����1��^U,�kņ��s����o=?E[�K�v��|g�J�j:��vq����St�_G&4+:V�1Z�E�QT��+:�B�� �F
�@*::�AG��D�@��wl���7FRvUޚC�'��[�::��w�ɪ�NJ}dDA�=�D���.����F7�(�C�fC�s��_�J1�/�n�kbʖ,[�,�	���W��.e��D��E�Q�5Oa���l�����qh�}N�pw��Vv�+/����3�*7�)w��b��n�d��0l��b�ml��A-�" z��-�87�U�rm4<O�"��N��F-���`�v���5�$��-��$o��&1IL�h�r�sK��"ϒ�6��$L���u�֒Fw���GK���Bʢ��t��O�w����u/;��O�'9Xd��3��/���+"˞~�����L�i��]-����}>�%1:�/ٲ+
z��c���T��N�E��<tW�g���5�! iy8mu!��/Rcu��%C�o�|�Q���.�́@i���X9�2�V�
�:�xw�+�'�x�kmH?�f�l̝7iH��`HoD�Bΰ�H>�l�C��<��C���d�����m�������_t��O���;}ۿ��7Y�:���4q|SA~�/.:�"�_�,����%���\\�t�2on^��x���O■��\��n	�$n	���$�i����/9���      F	   �   x���A�0�����jgj)�xWnLmBi"h���1����$�}�,�"��"gB&��3VZ�^n��m8��)�)���h-�O��
�tj�B��`�L�	}�|����o\,>Do 2�<�8U�r��uC��~��3�t���T}���Ƒ�l5�kٌ�ߎS��ZN��e��ӿ����B<���      H	      x������ � �      J	   �   x�s�RP�t�JM��LT 
@T��&�d&���S����Y��SI��0Մ�[���]����J�P��Y��Ғ�Y����������K��j�b�A��
�R�Z\B��A��q��i�Ҋ�ܤ��"b�
�+F��� �X[      M	      x������ � �      \	   �  x��ɒ�0  �3�
U�E�t�i��`�Xs	@ �M�~���dY���N
(�~�װ�fȋ�6�v��N�C���v���5s�� `��6睢@��T3r�&`���Ks��$xW3a�q������D�Iop���uI�#��O���"���?�y�b�hP���"x�VJ��J�X9�w��p����*���xUh�uc|���m�/��I/��-����~�Z��>��FO�oZ�.e��G1Jm�_�0Ȟ�$������y֟��?���#Tv|T��*�@/I+�3dcc�I���6}���뒾���i8&��Tݯ
����<��Q��U'�0�.��b���y��9cyMp��OF�ﱐ��#�HÉ��S4I��q�F�g�}
n2�jQ$ZߡX�)���8.ͣ��=7r���v���Sh��      O	      x������ � �      P	      x��[�r�F�������8v-�e[S�K��g˱7S�b5�&@�h��s�H�j��f.�����{�w��R��2��nպb�������}�;�~���_��U������߳��8e^ĕz��J�t�Y��p���=�ϹW���p?4?�q�-+X�we�3Μ��	��%��l�ɘ���R�$�dg����͸��V�\&��'J.8���"K�Lrɞ&Ɋ�\$j~_��mv8a+Y��,"�E�\0��9>�B��OT*���L��],�C2�������i�t:z�ș�L��'�J=�T�f��V��Sr�J��)�����'9S
�	h���by �^Pd^ I�yn��Èc�	�6!u3�4�cF<��&KBOD+�J|��Cz"�r#��8[�y�b��"���2� ��T�K�Z^��&CG�t��9f��a�桯�/�
��+��닔,�5k�B��\a�l��f�>�`aOĮ�􄦛�<��q�Z, ���p!�K�R�Md�ex����M�?*��B��˫�Q�̝�21y��y��j-�K;^y���ccX�'�V��i!Z*�"�1��;��hk�ƽ{��M�W���אa&2�G�,��L�2���cS�s��L���h ���#+��V-L)�I���kRH-ֆ8�=m0d��2a��p�^�>�)S�W�<������.[i��E6�t��|�����7��x����G��������b���{���g�t>�����a�u�p�O�z��k�Ҵ�w���k��f��������v��3����g�p������N����{��o:��6^�/�?�I�w!��Q�^���-2���s������<Y(Z��r�j�1���N��O�I���u[�E���`0��ޠҞ�F�,r���P�a�ɔ!N@h�S c�\�AP�T�9�g�
�d%xƜ�`��'>W�#<̈́y��0�S��$�T�`"��^������HO,@ls�pr��(�� �Ia.<$"�/����dN�#D�L|(�L�&�D�Yᑱ��,e��d�#�C!q�EHav�u,���D�	����y�g�sS���@3`�B��rDg-�2L�Ш����(�4"�k�q�2�
�	�,�ʔ?�,��Nݥ�bm��O�*z�D���C1Z.2�H�?$%�k��uRn@��HaHX%V���fh�frF�y��5�S�T$�)\Iα�j�B�F1K�L��$�k��<�8a29µ-u�HS$����y�G���q9�f,TpĔe8�RCn�lڢ_���n-Y�:�=p�m��⇥V�OwU6땼�6d.�M�O��$y)�����ɿ��};z���v��'hlڽ�lk�8�uqKK��HU����z�҅@����Q�aoʼs�	u�q�g��4��^T��8�Q��E(��><�E�Q�י$4�#������V%�̒:��@�RK�A�,g�a��o/��u.t�5���z7�������Sǝ'��߈J�ʟ8[�7
�ނLLˈU� �$��h!�*�6��i�,�m7^"��arA�UDQ�Lw�w�X��<z�*_�fef@䓉`�0X��m���������*�%�qn�3b�dX�=��c�{\�޽6�z�m���(��Y��Ҟ%E,(��4���Dt����|��;F���n�em_K�a�Lc��L{�!�����nSov���A"P�Z�_#�xH$ک�|�8@�W o���i5�t�S�ؕQ��{+4�	7D����m0�5-�9 ��b�Jyn-S��1oi$��Zp�~�qZ3���B�cC��4���k4Z�K��_	Jv"��F�����
����MDЍL���
�W��i��>՜��_�庭^�5p��8w���
��9�NF���㋉�H��:��i�-�91F�x_@^z��P��2�� �"���@��M�w��v�?t�Π3��"�Z�D�`�HR0g5V��[h��n9֢M����I�^g��(*T
�� �гQ�9^eS�IM �ш���m�K����XN�4;G�;�6�n�qh����D�<��:<�o�n2��&��{d�e��22��x���X�#Cf�ЧZyP�n��꺭s����	M�r:���º����<	g{2���J�Φ���&�ש����v����vzm{��.�s�s�p!2��}a/�4_o7��#�qX��q�;����0��8-r_�{��1o<������ϾgT��ԟ���٪�P�Ƭ��d�G��S����R�"�l"��o�l6+�ժ�i����of���vse��`�����n��Ղ��+�^O�
����$��K55䑼p��[T��[���up��pܮ�%�;=�B��IE
J$O��=؂���\�0��)"�0�h�kf�.`n�Î`�4�P~����˗%.Wl*5��L���0�A�s�)� �repq̧���j)�94��q�3 9|!����*h���h>F�tY�ƙ�S
�eD6�(�")�$��&Υ�d%V"�PmM��H1%���Y"oQE20�{P$���ΌZt/��po]d�,� �t�D�@�b���ȺP�� /�xL8YR�@H��W6{<A�66y�Yqp^��<g�AO��~�Kl7�QB榘Pjͬ��#��OU��T溨h�+�Fϥ&MR2�ģ	�V��ȥ)����H�d���>Y� <B7A��ϰ�ěUt4�b� M�s�ʯY�^�����=��D{���Tbq�}V����ay�@e�@��M9�����:�������4�	S)	�y��-i��(]����OKy27UvD�%�H����*�LҩG�Ҩ �R�w	�R�$H�b�╵o������SO�u��N����?<y���ӣ�.q�(rm:�V
�GFM��
=t]�j2�0�ga
;0f�c~Iŧ+�Ѡ���������Ɔs��#�w�[��v�.�q�d�/t�ى(�wMV?h"ƀ�6����B4ާ��y��������o�������̏&2W�,&��,c�;̱?��l���<��k��l�q.S��O��v�k�G�\�ͧ�\GF9��&�ϣ�ݲz���[y�	��%�ڔ�XI�dVUE�,��a��EYȬ*�un�G���=��v����㷺��'(�h�@��3�S��Sd:feU�.���l;��a�����R9��lvYl���2���v�д�U�;�9��a��Sa��;�^�<t�U�W(&/�� ���'>��.{���������Zu7�G"��A����C6�둯X�u$EAh_�O�I�7�q��搀�bd!�
��:���X���M�ܘ��>��YiH�H��ՕSW'1�p@��n�n�%WPڐ�Gb��N_:�ku���K5W�Ju����f_t��>tfɍ'>k���d����Z�����n��JR�q٫^ߺC��4��{f��7��L��a��c뷇��:.,����ߓ*����M_�*�|[��ǹ��Z5��������ϸ�{u��p^�bB�_�ζm��+��~�S�i�7s����
m܄m� N%O����У�kV Ƴ@FV������+����Ѫ�BW����z<����bv��Y�4Q��J��	1�R�&�9��_�SF"�),(+⺊�>�UuLG�J�rr*L-�:�֨��BE[��l�!mp�c�Z%T�̤�	b�ǩ`��Pi�p:�0,G#gJ=���s��g6��dΦ�1����6 ����CA��P�RN<�'¢ʳ� ���%��!}�^��Ǭ�qݤ��݁Bd*�c�J���8���?��.�`��y�ധ�J[����S�����߱���v�S��ɢ~�����3wq�˹L>�LE�Y����N�&��:E�썜xᴩ��bV�KQ��)�AR�"�����G�UE�l��rU6��F����?�U'��h�t?d~%:@ǥ�o��`�e}���H^��JE��h�sY��h�a�Q����}�/�X)9���]%p@fyY�q?	?��^�V*3��w�ؼ:�� �  ͳj@�ܰИ4�Ֆ	���x^C�y)�l���%�ߏx��v_k:g��J'k�3�&�3�4����)8���K�m�����{�M�R�Y�L��_~�uT���|�XQ�6'���v��lW���2��ߴ�CE��v�K���Eb�ċ\֏2ç���k�{��ɔ"aRN�5��E��_�u�{L'?|3��K�^��FA���������.�����c�
��兙妸?�;H�����JM�$}�G;� V��y]TEv�MM7.@)|l��@��9�՗�VY]Y��t���9��o� KWPb����C��Q�~��p���أA]��]|�+��p{�yH�L�?��_~A�����u-\s�3}�$�	^	���k�T4se�f���*�������b!xq7\���._�^��Y���c��*��<!��
DK}i�:�{VP��nr�mw]|
Z��4�����o��$}eoj��=	�m��ڄV�t?ۻ(�ӓ�k����>9���'/_���xi���������xsv�������������l:z�x����Ň����'���t������k��~�9L��'�'�D��ǳ��ݛ����y:}�����hv���}��x8{~zy9��c龜��O'����,�vމ�y����j?��Ugq�;t�o����������p��3mu��m�����8��p0�9���`{<h�N���Sz��6^��R�*��8�
.���E���<�m3�Ntİ�d#��~�y��+�fX�Ҵ�w�L�)�}S��t}��^F���9-¯'77}~����������^�/d#�lx~R�?�+7��ZL�CsP_�+C>�\!� $�jWT�����d����A�̧�/�pNlg�m�G-s����-"�V�K�:�d�}��ugk�m[��B ��;�O���U�On뛓�A'����j�'R����p2�[R_u�Y��k!�X�����J�؋P�e.�$t%q��n��4�B޹��|UD��m�F[���4\ ���,.ϊP]�(O���H��Q3l��	���I���<]*��T���9������١&N��6� o�Ӕ��zaJ�k2q*��
����L��a#)"s]�<�[뷾/J��eJW����AJ��ѡ�E~ #ʻ�L����T��]�Hv;N�n��.V^y8�o7����<;7}���ݢ�k�=�Utv��5l�u<���au]�'�޽{���|      R	   -   x�3���q�wt����2�pB�]���!� �0W�@� i�      T	   _   x��ͻ�  �OAa��m�%��ARF���"^X�G�ѸW�)1U�r(�E^,�JVKOʖ29�.k���U�icr"�%�f���4�{|�F x m�*0      `	      x�32�4�2��4�22�4����� 9�      V	   ]   x�m���0Cѳ4E�!Ғ�h��?G��
���-܂%4�k >�4�Dr��~�7��'W�1�c���{ckfV!��g��M�sOU} ��      a	      x�32�4�25�4�221z\\\ �      K	   �  x��S=O�@�wŶH����M$��"RD4���|^���%M������Q"���(o�("�:Y>��y�ff9E�a�'���ޡ�-��q�IW����)Z�Zs�b��J
a���T�=~���T~('�$��q�/������*��F/O�aLq�vVr�oc�HOr��LC㓫ɉ�|j���ռ�Z#!
M�Lbi�jj�����*�i���Bm�XQ4�4?���_�-��n>�7_��7o>�/<�W%Ma9�B2�eQ2���ҢW.�����dޞ'7�GY:*��Vf�J��Z�N��Y�-��L�Mpy��a�ɣ%�W��;�<�r[2��bh�M�	�Ŵ���]h�5O�|�e�Vc�w���d�a���V�1���� ��Gx�o]3&�qH�0J�YHQJ%z�D�}yz������P�i!���%�-�2��o�G�Җ����pJ�I �C ��)6c?"[������+��Ё`�l�f&TB���W��j�JM^T.L]u��Ua��(U�l����.���1����o���/��
Vkfʬd�iI�����^�������+��:p���.M �-9�=�6ζ�!�$�g��������47zh�O٘����K�dY(#7<����ږ�ZCߺK$Z�E��b�0��!�pZ�K�֓k&}6�o[���e���)a{�w���DE2      W	   @  x�őMO1���_�#$��t:�XN�/M.�pႺ��K�(��������f�7�3�Ȕw-u��f�F�c ������Z�:ȁ�
���+��}QF�c�l_���7V<������϶��)	�G��/�0��m����uͲy�����
4|4�]��x�n~�<n�1?զ&�	DE���f�o���p�\aF���΃�vr(�k�ip��)�K+���r�.��4y"�P��m~��v�l��_�&|���r|�O#��~.J�a���`�q���^�Q��F�"�-��L�-E�@e�0�P���e�����D�$_,�n      X	      x�34�4�21z\\\ q�      Y	   "  x��λv�0 ��9<EWlB��J�R����i�rU|���N]zο?&�*X�۬#��0mU����x�匽}��[�ׁ�X�p��.V����ϲ�B�| y��8��%ˊq,JЂg������IWC�������� l�Ȕ1��L2����l�0祸-m+��#{:ǮDPt���=}j��=m�c�j�,�,�nc/�si7��TF�O�������Ē���7����F[�@�Jk�D�N���f1o^I�vWd���Q�QŃo.����iy���ػ�$I�9{up      _	      x������ � �     