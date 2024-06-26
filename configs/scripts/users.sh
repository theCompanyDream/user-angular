#!/bin/bash
set -e

echo "Creating Users Table if doesn't Exist";

# Create the USERS table in the $POSTGRES_DB database
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE TABLE IF NOT EXISTS USERS (
        ID UUID NOT NULL,
        HASH varchar(64) NOT NULL,
        USER_NAME varchar(50) NOT NULL,
        FIRST_NAME varchar(255) NOT NULL,
        LAST_NAME varchar(255) NOT NULL,
        EMAIL varchar(255) NOT NULL,
        USER_STATUS varchar(1) NOT NULL,
        DEPARTMENT varchar(255),
        PRIMARY KEY(ID),
        UNIQUE(EMAIL),
        UNIQUE(USER_NAME)
    );
    INSERT INTO USERS(ID, HASH, USER_NAME, FIRST_NAME, LAST_NAME, EMAIL, USER_STATUS, DEPARTMENT)
    VALUES ('f042dad9-79df-46cd-9670-ca15af6184dc', 'b64ee9af7d6d0baf9c48c489780b1f3827a6dc01fb499d45c9acaf6bfaa090e9', 'peter62', 'Lori', 'Guerrero', 'zlittle@example.org', 'T', 'Accounting'),
        ('7bb38e48-528a-47dc-9e37-388a6f308b79', '9a13b22c358643a6d36e6756d7f5189c51e70385d63f3ae974cd405da3a7618e', 'kimberly55', 'Jose', 'Snyder', 'mooremaureen@example.com', 'A', 'Biotech'),
        ('210792c9-3a65-4397-b8db-453e41b06b67', '998a17fff5ac7b0b2b14fd9452f7ee9ade090a2f07c260ac588900f28de858c2', 'rodney03', 'Jeffery', 'Smith', 'linda88@example.com', 'A', 'Finance'),
        ('75640a24-2d03-4653-b278-555ce6bb86a9', 'b34dbacfea170b7c363225f708d7aa9da601bae17284ff2f025fc8f93ecb54e8', 'heathermartin', 'John', 'Phillips', 'jacksonsamantha@example.org', 'T', 'Accounting'),
        ('552cc317-f0c6-4849-bcd4-c9a5be17be56', '77c1a1dcafc130bda472b4206fe93276eb84cf8fed2866d607584397cc2fba7c', 'perryjohn', 'Joshua', 'Lucas', 'dlloyd@example.org', 'A', 'Accounting'),
        ('3bf19f61-110e-45e4-959b-521bfbe72400', '38ea71e8a1f2af71e579bb5debef13cb1476379ac1713b049ef16865a74d59b5', 'priceanna', 'Mrs.', 'Lisa', 'angieyates@example.com', 'A', 'Finance'),
        ('b6f47e99-aab1-48dd-9478-99ec8ac6f49d', 'a6b8decba97b3ad648fc90c8cbb25e1b1eebc95dfb2e3e9d08dd0224757ed333', 'hickmanmary', 'Randall', 'Griffin', 'wileywilliam@example.com', 'I', 'IT'),
        ('9567f047-e6f2-467f-9674-07e1a476d28b', '5c10b9aa5008abe56308006e6447c87eee3fa9a706c56620f3a5ed847cf3970e', 'michael86', 'Dale', 'Dunn', 'fergusonjennifer@example.com', 'A', 'Biotech'),
        ('3fe9d03d-46ed-4484-a252-dcd8094d61ce', '7f0750765d7baae4515b852424907c9741efde1e3ea9f43859d35468329351f4', 'terri48', 'James', 'Ramsey', 'susanroberts@example.org', 'I', 'Biotech'),
        ('2ab0b321-12ca-45b2-99c9-64084460d696', '022344e3d8e090a6701f6caf847c1514acc9344ffef7938bc43cdef98bb2cdd7', 'riverajames', 'William', 'Dixon', 'janetwong@example.net', 'A', 'Finance'),
        ('5482ee63-e3c0-426b-b046-40561912f4f7', 'a0b286782a8e077635b245ec7bc74b0d45919b4b509a6824030a622182b65df8', 'alan20', 'Martin', 'Berry', 'richardyoung@example.net', 'A', 'Finance'),
        ('a933e4f7-a451-4300-b668-ad88fcdb977c', '0d1458dda9e5f690001b508025c54e98684160dc197c0ccde59cf34a871b1ee2', 'danielmartinez', 'Nicole', 'Peterson', 'nathaniel18@example.com', 'I', 'Accounting'),
        ('97745947-fd55-4cd6-ab5d-de4f779f0319', 'bc9a6d0792b3ab90e089ca5dbf97bda2c31abdb3ed03102d5b9f9b8d5ca8b0aa', 'salinascasey', 'Patrick', 'Buckley', 'sarah63@example.org', 'T', 'Finance'),
        ('f2139467-bbb6-4b0d-b881-0a274b5e6db2', 'db7a2562160a96ff8540780404fe67aba0892437fbb3ff7396c69f3bdb094367', 'stephanie53', 'Lisa', 'Cox', 'joneswilliam@example.org', 'A', 'Health'),
        ('c28d9ebd-9544-4609-a6dc-d77950fa71e8', 'a4b9af5549892e5f0feed3828f5b04257b71cf6688db92d878dfc16af31d79e8', 'gpaul', 'Kevin', 'Powell', 'michaelmartin@example.net', 'I', 'IT'),
        ('e4a9c015-204f-4b87-a3a8-4d59d718c606', '16e3567bc45d6acbc4893b33c9393744bed47079accfa8b308312a8e674e78db', 'annkane', 'Ethan', 'Jones', 'kari59@example.org', 'I', 'Health'),
        ('b58599ed-c4fa-4a05-8844-f2310b582186', '75467ca08d3369cd8dd77e148e32f67a64dfb557de48c3216b3b6452f2a7552f', 'leverett', 'Andres', 'James', 'amybarker@example.com', 'T', 'Finance'),
        ('74cf7af2-ca06-4ddd-b740-46aa65093b2b', '51c40241d05f54435ec6718af73c7849f87794277213862f4f0e808b70c4abec', 'gerald50', 'Brian', 'Wright', 'vaughnbradley@example.net', 'A', 'Biotech'),
        ('07f0116e-b3a9-44e5-8b59-fc230c0154c2', 'b8bc4ee556eb25ae9be1eba98df6293d3864bfaf5fd6dde06802f3102afe3a0a', 'shannon50', 'Nicholas', 'Stone', 'kristen03@example.org', 'A', 'Biotech'),
        ('8cf5c76a-7f05-4ed6-8156-75b293746283', '99cf903442809ea13e81cc11e2537602d6a48267c374b70bf24f6b95ffb339d1', 'kevin89', 'Madison', 'Escobar', 'wramos@example.net', 'A', 'Accounting'),
        ('ebc32d48-e535-4ff0-bbd0-489d0f22f8f9', '07332ba21003ff05b0853286c406e45bac1dc05ec9e609ea9d94402cac6f8195', 'tiffanyjohnson', 'Ariana', 'Hunt', 'kpetersen@example.net', 'I', 'IT'),
        ('40d05970-bdda-481f-b914-03d4546ff5ab', 'e00629ea0239bc173bd811fd8b93014e00a267dac4c4f05a0f40692a0a80ee0f', 'trevorstark', 'Carrie', 'Ibarra', 'millerandrew@example.com', 'A', 'Finance'),
        ('20401a34-af84-4935-8ee9-2b2e992adaf7', 'aa145e00010586fce4c51a9b8974beea10cb33ac1a70566002239024d46972cd', 'michaelkline', 'Philip', 'Silva', 'xaustin@example.net', 'I', 'Accounting'),
        ('3ef7f435-6c54-4854-a941-3e255e7d9f6c', '494442ac477400995344aa1e9847717674e851e8f631cc2be6af24f7a0d1c5e6', 'lynchpatrick', 'Rita', 'Taylor', 'kelly23@example.net', 'A', 'Health'),
        ('819615a4-d4c8-4052-b1ac-1b5251240c36', '8aa23dd137991cb7d431a8da59687abcd62267e72dc325f33253e19b1b801600', 'mendezjoseph', 'Donna', 'Golden', 'washingtonmandy@example.com', 'I', 'Finance'),
        ('cbea8c70-4ee6-43cf-a150-49bff3847ae1', '5703c313fd1a4a83210c47fb48366dea91048e258c82721978fd3a5264dae94b', 'andrewfritz', 'Michael', 'Byrd', 'ashleyfrazier@example.net', 'T', 'Accounting'),
        ('3eb0084d-6555-4e78-8e27-293e1a4ea7e1', '9abbb2bab0f40ae421c7a3c53feb0d72ff52c325bee15b5f14616493f143fa23', 'martinezreginald', 'Judith', 'Hayes', 'josephramirez@example.net', 'A', 'Biotech'),
        ('83f28a68-ff83-4c2f-9a83-a7b29dc1d888', '73f6482cc2aab2bc8ee93d1c08f2bb6718194681c5d0ca8f32fdd21882d42394', 'munozdeborah', 'Christina', 'Wolf', 'vstrickland@example.net', 'I', 'Biotech'),
        ('6e36b0f8-e6a9-48ad-81a8-5b102f526a56', '76b0626f6df8811b750a67cd923f87867642b58f742ecbfd74438c1152329b75', 'dgibbs', 'Samantha', 'Steele', 'lisa22@example.org', 'A', 'Health'),
        ('03d1dbec-8958-4242-a8b8-901a0c61b1f5', '683c3add9ff7c2d6fa4a37b553a972a20e28536b57dd1bf74eee2a3e348ca883', 'aadams', 'Derek', 'Silva', 'hernandezsarah@example.org', 'T', 'Biotech'),
        ('cd1c511f-edfb-4b2a-a0bb-d5b1be85974b', 'fb1bcd460d598d08a060cedf8d3eb6a246297738f64f3b407cc00922930ea275', 'xarcher', 'William', 'Kidd', 'emiller@example.org', 'A', 'IT'),
        ('1e1c7a3b-4820-4ed1-ada8-ea4bc8a13af5', '56cf9f3721f74e8f4ed200e0bdbc22345bae38c28a666c051f064d8440da475d', 'kingrobert', 'Thomas', 'Alexander', 'markbennett@example.com', 'T', 'Finance'),
        ('c2d4d331-cfa6-4d6d-a681-4d2697c4cd6f', '7021f9f92c3e4387214688a654252c89e81c8c76269aaf3122d62d46482d550a', 'kelly27', 'Tony', 'Vazquez', 'fordjose@example.net', 'I', 'Finance'),
        ('90ad93a4-346a-4fbf-a660-f51d653b069a', 'd87e2f85b6ac41a54781fce61e59c22db96e7316a0ee4df5d95bc167aeeede3d', 'lisa46', 'Alicia', 'Moreno', 'rodriguezjudy@example.com', 'T', 'IT'),
        ('12d37b95-15f5-4eb9-a770-37f59d4f5678', 'd0f2ad0b8084022f7318a569e663bdf0b765ae2fb6e9fc1daf2c0f98cdb320fc', 'jhogan', 'Kevin', 'Welch', 'darrellthomas@example.com', 'A', 'Finance'),
        ('17ee4e74-d621-4c9f-a221-7ded5a1aba09', 'b1ef764de95de2fc8045788ae3e25d5cb1f8bd45e2c8663687927705f6e1bc03', 'pclark', 'Tara', 'Patton', 'ricardo69@example.net', 'A', 'Finance'),
        ('4bc4a962-ebd0-4f65-b72c-b1c39dfd11c6', 'f17fe2465a0d06823bb89f6a131c6ba9cb295669586b7040824fa1d1df8d6cfb', 'phillipwilson', 'Todd', 'Donovan', 'dawnwashington@example.com', 'A', 'Finance'),
        ('cfaaa0a7-404a-4a68-a8e2-bc5ba0a2b04c', 'a4c6d4302eaa795dcc71dc5e4dd62f1ea86b55ec453c63f390bcdea8222836a0', 'bridgesjohn', 'Casey', 'Tucker', 'rhondaedwards@example.net', 'I', 'Health'),
        ('38f4355a-a8d1-484d-807c-a17de424352c', 'ac1ea197333ea1ddcb2cf0efc87f25b8eb8eea809144794e90376f0c48f98dc7', 'zblankenship', 'Megan', 'Walters', 'abigail48@example.com', 'A', 'Health'),
        ('531732a1-d8d4-4676-8fbd-5fb8b8fcfa57', '8926b085d7430028e7837a8b3b1b8d5befd5e9807a61419a84651aadf1a7eb25', 'garciajeffrey', 'John', 'Diaz', 'medinaryan@example.net', 'T', 'IT'),
        ('66851cbe-0d99-4a6b-997b-53c91937c05f', 'b4554430ec76ebf1f4b72dc7db47bfbe7a5f0ce1014016978ecbe12a88f793d8', 'jonathanhenson', 'Linda', 'Ferguson', 'jasonmcintyre@example.com', 'A', 'Biotech'),
        ('7e745cef-a225-4458-96a8-c72320789068', '655436e4fe24f02998a555e8201b17e82a92200e37129740251f22b62b4e5a3c', 'christophermaxwell', 'Benjamin', 'Armstrong', 'griffinkaren@example.org', 'T', 'IT'),
        ('974fae67-dea4-4f35-9f7c-040a5b5d6930', 'b8adf171cd51d041bbfaa01e614f39d38428e4ef9af0367dd425a985d8ff4171', 'dudleydrew', 'Caroline', 'Gonzalez', 'jesse23@example.net', 'T', 'IT'),
        ('83fed56b-6ead-48da-abe7-d9d48133c1e7', '8a07eecacfad4714f1a038e9f560484bba0f468f01aad831256a708ce1060fcf', 'sean51', 'Kathryn', 'Deleon', 'jesseglenn@example.net', 'A', 'Health'),
        ('da2d51cb-2c21-4148-bbc3-d70103311608', '3d3639a9e8836c56e82e0f6cf86e65626c4cce6de4c83da0d0244ca1d447d158', 'zarmstrong', 'Brittany', 'Anderson', 'thomasryan@example.org', 'A', 'IT'),
        ('54484c03-f419-4bb6-a905-f8ca8503bef5', '603b6cb8416adf3a40327ca0c7ca36ac2f237f7599fe9375a229799a63d1c823', 'loganwayne', 'Alyssa', 'Atkinson', 'laurenmartin@example.com', 'T', 'Finance'),
        ('18b5022d-27a7-47b2-9cee-1f438ea9d6e7', '5785d353f343bb187a16a7dcbc30070aad01d123bc8815eea5e2e4a99ea5e9fd', 'ebrown', 'Diane', 'Goodwin', 'tyork@example.org', 'T', 'Finance'),
        ('e82cc4db-c105-4f85-a858-5392c2593710', 'c78418507676d078b1ac4f43cdd49b1602259d154e5fcf3d570e107f9c64cd2d', 'colintaylor', 'Ashley', 'Rodriguez', 'richard24@example.net', 'A', 'Finance'),
        ('53f83585-e48b-40d2-b53b-6eb1b2afe619', '19248580e88c5c16fa462787daff792c1928b6d97daefa0d2d54113da116dd18', 'bobbylopez', 'Gabriel', 'Potter', 'zbonilla@example.com', 'T', 'Finance'),
        ('3f4f04f4-699f-406a-b0c9-e1c99737e84f', 'f2ad6d1bd7090aae12805ca2e1050bfec12c0dc682e4bf4299d951c9b5590e5b', 'jennifer51', 'Beth', 'Phelps', 'rogerstamara@example.com', 'T', 'Biotech'),
        ('7112f745-4921-476d-875c-30d51efb97cf', 'd60bae79dd8830ff1833c3442bd7a6b8453d4d87714dbf2212dc5e1a87eb3263', 'apena', 'Ruth', 'Gray', 'kingsandra@example.net', 'A', 'Biotech'),
        ('9a9b53bf-7226-4ac0-829b-16b74411b3a3', 'ef6d28c52158b1dad553ba76098685ed696420943f4956ebaf91748ab87f2f4c', 'graveslinda', 'Deborah', 'Sawyer', 'mark97@example.net', 'T', 'IT'),
        ('7b0304af-7767-4cff-948e-a753512a37f2', '9599639e0d9586025ad899c47ebb9f5f38c0f87c530281ca6d8b485ea464e9f0', 'christopher60', 'Christine', 'Nichols', 'mmoore@example.com', 'T', 'Biotech'),
        ('bcbc3277-8e4b-4fce-ba62-876c91ca0098', '176a7f3d58cef66f849c1147f746ba5d4ecc46959fb727ab95d948303afc660a', 'moranjulie', 'Michele', 'Bryan', 'milesjennifer@example.net', 'A', 'Biotech'),
        ('08d6e0fe-2b3c-4d93-b6f4-8fc61523f51d', 'f9533222efe5a2bf2432c2a37c52bed2bfa8160c60b8f5126e086bcd7264bd58', 'stephanie63', 'Ryan', 'Thomas', 'johngonzales@example.org', 'T', 'Finance'),
        ('e0ed38de-ad72-4267-92d5-b94a1bd76021', 'ed94063758279083f7898d9dae418e88ab1381490c2dd2f21a534b6bbb4c400a', 'oneilljohnny', 'Julie', 'Parsons', 'mason05@example.net', 'A', 'IT'),
        ('5482778b-d3a4-4a68-bbe4-4fe7d7cf765d', '4e0c7cea35ef630558d5019d595041035f0abe40cb232e1f7661163028ea30c3', 'martinezbrandon', 'Erik', 'Williams', 'rodriguezdaniel@example.org', 'T', 'Accounting'),
        ('bd7513b9-9476-4141-82f2-6b2c94f4ed5a', 'd3b2c5f0da94340f01ec16beccf6b9b3d5563b7a6a63ebc622fc0b890a01687c', 'garrettscott', 'Joe', 'Perez', 'smithvictoria@example.org', 'I', 'Health'),
        ('8fbfffbd-272e-48ae-b94c-ec5da19ed3fd', 'a1bc32617114c9d2f2de0b15fc53f61e3af68b4570e209a8072aa00eeb67644f', 'meltonvicki', 'Audrey', 'Ramirez', 'parrishdaniel@example.com', 'I', 'Finance'),
        ('ad364b9e-ebde-41e0-affc-1c1ee0ee0a3a', '7c06189fea6ffab34e3ef515ab075bbbd7de4ce69b56866d36f4afc1cf9eabfc', 'alan66', 'Paul', 'Hoffman', 'burgessmelissa@example.org', 'I', 'Accounting'),
        ('40ce7124-cd9c-4ef5-aefd-07fcd1547e39', '92a09d221f4a644a8228c14556503c885e791c1f31b7c5d1832a3d8ccedd1969', 'yowen', 'Brian', 'Brown', 'samanthacampbell@example.com', 'I', 'Finance'),
        ('77430f87-986c-480c-ae88-b072572a852b', '59f4bac49b7057fe585f63c1f53a1e584a9410cc54218ec40e15e287187d908b', 'dillonsmith', 'Amber', 'Edwards', 'aaronerickson@example.net', 'A', 'Accounting'),
        ('9c087a3e-5f39-4d3d-a7b3-479b2f8e2538', 'd6763e18d6d4dcf9ce1a09763a39bb0248977e5e941a9c7ce6d4058df1871474', 'dianamitchell', 'Jennifer', 'Shea', 'michael78@example.org', 'I', 'Biotech'),
        ('906963e5-1f0f-4108-8a58-5c9abfe6bf50', 'dd19b3e3f3c894baa41f92ed4be49983ccab1ace624afe63bd62e1bc9cfa30f8', 'andrewelliott', 'Mark', 'Phillips', 'david00@example.org', 'I', 'Health'),
        ('754d5f05-a2a1-41b5-b641-57063817de0a', 'be4ad5473bd3e5e524017e3f4b75fb1182e70c7ec235531df351cd2bd4757f7c', 'joshuaherman', 'William', 'Austin', 'rparker@example.net', 'A', 'Finance'),

       ('cbec115c-e5bf-4a7d-b1b3-384ea1684871', '4789352f5365d8c8e136a9dfd72be910d8d86f8c25295cd11257b0e33e65f5f4', 'hopkinsjoseph', 'Megan', 'Lucero', 'josephhamilton@example.net', 'T', 'Health'),
       ('5a7bd0c8-a8dc-4c12-9a1d-227d16dc2309', 'ed5029d76c2819558b2d5d0695ed68d24b3673fca4069644c9eca58e1c260fe2', 'hayleyhill', 'Kelly', 'Foley', 'cnewman@example.net', 'A', 'Biotech'),
       ('ba2a6f1d-d04e-41e4-8432-e8646578c8c1', 'df8a39b8703fb1cd730b8b8801014dd8e0c1a3f48a1c0198e7eb7a4380e4a87e', 'mary79', 'Stephanie', 'Murray', 'jennifer61@example.net', 'A', 'Biotech'),
       ('749912ee-9e3c-4704-b44f-e24608efaf1f', '96881c411bad8818b125ce7a2b5b9894674c9e76f4f3bee57f2b7594f995acee', 'william78', 'Nichole', 'Lynch', 'larry96@example.net', 'T', 'Health'),
       ('60c2bb80-048c-4470-8ddf-0bd7fac0d751', 'd32413ff1ab68b3bf07e100c672587d3938936321efe9fc9632c436fbad529d5', 'leepatrick', 'Eddie', 'Hodges', 'operry@example.net', 'A', 'Biotech'),
       ('8ede02c3-b908-4bb5-ac8d-4a9abcc3d965', '52b7815c2560a7a1ea0307ea2e3210c9b1b4f504923e35a4d0e28610f8c543b2', 'reynoldsheidi', 'Rhonda', 'Gutierrez', 'wjones@example.net', 'T', 'IT'),
       ('f292cc04-b0a8-4ec3-b297-a88f1845cd7b', 'cd7e05f17c3f97eaaf79728bacfe06a560c03107c4ac6bf63eb46db99ee67665', 'qjohnson', 'Amber', 'Schwartz', 'shelbyford@example.com', 'I', 'Accounting'),
       ('f5f9d676-3d93-401c-94f2-8be69b95d27b', 'beabbf3f5c902afdfcee9e34844cc010a34eea2f23ebaacc2b1c1c477e7c43bf', 'anthonybailey', 'Audrey', 'Smith', 'znelson@example.com', 'T', 'Accounting'),
       ('9e3e5c38-2a3e-4aaa-ae7c-f45e661c1df6', '772d45fc9aae798e1c491a1167b5fde175dd4a69b69751bb34d92f4eb3297d62', 'liudavid', 'Ashley', 'George', 'olivia28@example.net', 'I', 'Biotech'),
       ('5e261508-406d-4301-bf1c-d4f900a983b2', 'de793b0d18dbcc5c0becff5f70de34cbd2eec42ea82b9246387795a633fad12a', 'danielhuff', 'Donald', 'Jones', 'ronald32@example.net', 'I', 'Accounting'),
       ('9095704e-e162-4925-a261-236c490539c2', '4bff876b96feac765da47ce3862fa1125d14d474e7fce3f5c6360fc84906cad2', 'amberrichmond', 'Deanna', 'Morrow', 'zhawkins@example.net', 'I', 'IT'),
       ('81441b1b-588c-4a82-9d94-2337f1a09b8c', '460e2bffa9bd0fcfccacb58dd3561ffebe8c41cd456d98b4acd73d54b75c97f4', 'jamesphillips', 'Carolyn', 'Davis', 'meagan29@example.org', 'A', 'Health'),
       ('e37793c7-9960-4a42-ae7d-deaa9d9138d1', '4db24ed914ef5bc5c1441ffbae7d214440d8687860475cfc704aa28e4f6c185d', 'tina40', 'Christina', 'Parker', 'mallory25@example.net', 'I', 'Biotech'),
       ('1a0fc237-1364-49b2-befa-151333c007fe', '36897af8356baa37deebc5e9a7ec424e7521d4eedac1770d415fa67956850c70', 'longmelissa', 'Amber', 'Davis', 'downsjeffrey@example.org', 'T', 'Biotech'),
       ('cc21a2d2-0581-455b-a399-57170dc30c96', '13940ae656dfb369361cdc21ead7fe3621cb88dc16051fb9d28be76ad866490c', 'ian33', 'Emily', 'Potter', 'mullenjennifer@example.org', 'A', 'Finance'),
       ('66239eeb-998f-485f-8c22-90ea4a29aa09', '6a0bb33fb3bfb409cff555b6afee6d3ae3c8b3984a57ccb5effe447e9d52125a', 'jimenezheather', 'Alan', 'Walker', 'hayescharles@example.net', 'A', 'Finance'),
       ('b03845ff-6e1e-4ba5-8722-95a8fab9c7f2', 'cd946cf56ca49666b168b57e4dc359bc37b0fe36e10979da45341297bf76cb4b', 'aaronhanna', 'Aaron', 'Smith', 'reyescarlos@example.com', 'I', 'Finance'),
       ('2d966f51-13a2-4318-8682-df7d89d9aa72', '45ba9520386e51ebd7a2461c6d23719366ab5121e1de416ab593d6cf3b06d82d', 'kendraharrington', 'Kelly', 'Oliver', 'william46@example.net', 'T', 'Health'),
       ('3d363782-d31a-4797-80b4-5ded5925ea9f', 'c710f66ea5e9e011c1743f2f0dc1d26f4ac4d987497a25a6dda4651b02045a85', 'brenda99', 'Sarah', 'Daniels', 'johnsoneric@example.net', 'I', 'Biotech'),
       ('099f7880-e587-466f-afc9-98d2cf98a221', 'd04312156617753d918c1b5e35a75ab1b46bc5896c00c741cfe8ef7d259ca500', 'briannasosa', 'Shawna', 'Barrett', 'rileychristian@example.net', 'A', 'Health'),
       ('e6105bd8-fc2c-4c1d-a42b-879ecef4f8e6', '52a1ae5da303049c278f28363db74add7dc8191486f8a2d7a71871e929a063e5', 'janicestout', 'Sharon', 'Hernandez', 'zdavila@example.net', 'T', 'Biotech'),
       ('a2aa4075-9dc8-4d72-ab35-ddea60991d1d', '369fe54ef9a87e0c923d997e9cedec17f9c9e905166721b9a7f1117015ea72c8', 'ariel35', 'Virginia', 'Ibarra', 'dawnjohnson@example.org', 'T', 'IT'),
       ('165c2e0b-571e-4205-9769-b55e1f2c2ab7', 'f9fd0c21425ed98d48526d8e46760e08133b557d6dc4df88018d3f6c32eb4cde', 'joneslaura', 'Angela', 'Roberts', 'ntaylor@example.net', 'T', 'IT'),
       ('94a05c54-4695-414a-9947-233fd6397a98', 'c7b585fcaff5c5dada1b6a6f91cedc21614618dde2153416e742decc1f6fed76', 'wcoleman', 'Judy', 'George', 'nancy78@example.org', 'A', 'IT'),
       ('f7be57ad-5a89-451a-949b-9f8ff197c0a4', '96720db27a74d5805f5ae3927b3505fb4347069b031407df5516198cad4456cf', 'amybanks', 'Robert', 'Mcdonald', 'garrettrodney@example.com', 'A', 'Health'),
       ('c5e60058-febe-4390-b427-f7f2a07db8d4', 'b787e1587a7c6bebe66bc75055b0b8bc9010ef2e049f2f9cf8635975684a2789', 'ariel37', 'Jerome', 'Silva', 'michaelsantiago@example.net', 'A', 'Health'),
       ('16e0e3a0-449f-4c54-9cd0-35a69035d142', 'b4b3fe848d6ef1e83a5afed261af58d3a5b32c68e5f103d394bfe2666393484f', 'jessica84', 'Donna', 'Smith', 'christophermiller@example.com', 'T', 'Biotech'),
       ('532f4695-722a-48bc-b4b4-4db1427cc231', 'bf9523da525438127f8e3ba9b4fd7da8e3df8ef3885364a94f9ce1ab648b0ebe', 'joshuaallen', 'Todd', 'Jimenez', 'hayneswilliam@example.net', 'I', 'Finance'),
       ('8de66e5c-784f-4041-b475-6149b9c8adfa', '5bfa8f5f1b0f3d5e7f9dd8daf1b8ea79720825ec7ba71464d8976ee250e0504e', 'djones', 'Marcus', 'Nguyen', 'denise95@example.org', 'I', 'Accounting'),
       ('fafc039e-f89e-4d5a-b096-af7aacef6091', '2390e78e1a2144d4adb2c58faf982c2f1bd988f94adef25c820e6abe34284a56', 'ujohnson', 'Kelly', 'Shields', 'hawkinsamanda@example.com', 'A', 'Finance'),
       ('04eb8c97-fb6a-49de-b484-fc2982e9fc7d', 'ca0107d4665093ccd065585df79a3d889d87fafdc96a32a1df2fb4a7ae8471de', 'xrobinson', 'Jacqueline', 'Jenkins', 'fschneider@example.com', 'T', 'Biotech'),
       ('6d0b38ca-8a03-459d-830a-f90d27062a86', '1f481f2bd4b4cb9fa1927d30e4f2b4934b2c910e910b84bd3d9a1812c65c94d0', 'jeffrey98', 'Jaclyn', 'Rose', 'frankbrittany@example.com', 'I', 'Finance'),
       ('469bb239-0a79-44e9-b06e-b5cfbd0e63b1', '9c56f4c023459a4cddd04122e52161ae4e58a49623b5007b949d9882e734ca59', 'jamie94', 'Natalie', 'Nguyen', 'whowe@example.net', 'I', 'Accounting'),
       ('a35d9a08-4ca5-4c3b-bc90-588b64a84cd0', 'fb0b8c796335d7cc511cd2539b5888b03f6233a79a006187a8053a6352aae4bb', 'nataliebass', 'Sean', 'Riggs', 'nicholashill@example.com', 'A', 'Accounting'),
       ('f07651f4-ecc1-4dba-b17f-a0bf7c33c653', 'e17b0ca22bca6617ca8b0958616561526e936c1606e02f193f986a9b7d77fe9c', 'wbrooks', 'Angela', 'Perez', 'morganhutchinson@example.org', 'A', 'Finance'),
       ('bc7911b3-28b4-467c-afad-a1794686144e', 'c5525b4496c506a5cb5d7fb0d57627d42ec4348fff063545d376339210e558d4', 'englishaustin', 'Benjamin', 'Williams', 'pbrown@example.com', 'T', 'Health'),
       ('d7865416-ff2a-496f-83f1-21ec54570be8', '27349e7667ae0e712e3b8c1edf5062c46ce7302c218c6752dd3e44a97db49127', 'tiffanyfields', 'Sandra', 'Ruiz', 'chris15@example.org', 'A', 'Finance'),
       ('e1e14243-1ba4-4cbc-9adf-524546985994', '12bef2bd5145014c4e4ca427729552a7d36757595ec14c761fbb539ca67fada5', 'suttonmarc', 'Jessica', 'Dennis', 'james61@example.org', 'A', 'Biotech'),
       ('2838f3b3-74ec-43c2-8e68-c61b12b623e6', 'f0e749cf21c976127af5a052802e6aaf9b46d496f294733a7a27b673ed63dbbf', 'fvillanueva', 'Adrian', 'Harris', 'shannoncox@example.com', 'I', 'Finance'),
       ('af851d81-0f6c-4505-8b70-3f42ba6329b0', 'ce2c10f87a32a22c1ae065c1c866aa80b352ab5d5df774d548012c688892856e', 'laura04', 'Katherine', 'Johnson', 'banksvalerie@example.com', 'T', 'Biotech'),
       ('bb9c7033-460e-4c02-886a-6bff030b1b0d', 'd990a689ea5b62dd5c76b40fa35659978775743b3fb4349eafe3e2a67f7af85b', 'jennifer06', 'Joshua', 'Jacobs', 'gonzalezkevin@example.net', 'T', 'Accounting'),
       ('291ad051-0930-4dd2-8a4f-4b58c70d2749', '31d9203cf1b5179c96c8b6b1106abb749926a5501747d5c3dd4d9400c4c37fef', 'emily77', 'Theodore', 'Preston', 'rwilliams@example.org', 'A', 'Finance'),
       ('4ac1df24-c0e7-4e5d-b309-5758f32fb60f', '0de4ba7c45093b9ee75dd6e6459f280df4766561bb97cd65b4113bda4f2b7d20', 'xallen', 'Daniel', 'Williams', 'cjones@example.com', 'I', 'Accounting'),
       ('090e474f-1f11-499e-9f29-5fc99dd01d82', '9a4ec10284cf978c3732466cfe91d5cf63d999ab5e04eca246a02360f8f69df6', 'yperez', 'Mary', 'Myers', 'phumphrey@example.net', 'A', 'Finance'),
       ('08d868ab-bffc-4297-add8-68aed67a3fa3', 'fb34b2faeeff41f62d1868e7cc7bd6700c9f675a364fae379af3c79b7ceb2e42', 'hendersonarthur', 'Brian', 'Mitchell', 'savannah45@example.org', 'I', 'Biotech'),
       ('f9a01fbe-ace9-4fad-bce7-abf0afdce714', '08627d5b48f51ad04a85c99723e245634e0eeb797f3847d3880a3777a61916ce', 'alexanderarnold', 'Patricia', 'Schroeder', 'ksmith@example.com', 'T', 'Accounting'),
       ('392b96ce-46ef-4571-b528-d6ef1e52c7f0', 'a6a77a3b54b7b9a72532f6c2d5b317755c4626da0ef04b6cb3cab03ce5b643ff', 'jacobsingh', 'David', 'Morris', 'nathanielfitzgerald@example.net', 'A', 'Accounting'),
       ('61dec4e1-8ba6-44f6-b770-8ede8f1c0e25', '6ea713c25d0f90bc246582cdbc3258136f85dead3b848bf390f5c5f43d551165', 'stephaniejohnson', 'Pamela', 'Robinson', 'collierelizabeth@example.org', 'I', 'Health'),
       ('e00b77e0-297b-476b-a5be-feb196a2dfb8', '1f5671b22ece0780e14e0f8bea4f5dc55dcbd8e68f6ff06db493e52cfbdd3196', 'xhawkins', 'Julie', 'Barrett', 'davidortiz@example.net', 'A', 'Accounting'),
       ('56720018-b2de-4b3c-a0f2-70e0d5cc5f71', '834b68040f94b8f31884c3e25b8ec6ede7f6825b95f07855945ec58dc698ff5a', 'christopher13', 'Haley', 'Butler', 'rtucker@example.org', 'T', 'IT'),
       ('7b593f8c-90d2-4d78-a6a9-de68ee87e322', '701bba00b13575c29e15e8f1bfdf6cb67ad681f6e960b3332db5eaa61153138a', 'tosborn', 'Emily', 'Schwartz', 'jonathanallen@example.org', 'A', 'Finance'),
       ('6903e1a5-f80e-4959-8a1c-05ed720da192', '0db11b6458f3adf324ebaf2cdb7787bc76fe6cb42f9e4e9a3b3ae215d9b3fc2e', 'brittanyespinoza', 'Danny', 'Paul', 'ellisheather@example.org', 'A', 'IT'),
       ('a81dd9f8-497c-4ab7-9e13-58d7168ba52f', '6eacfea51d74b22482afaa8ea3e383728de1822743412a191d5f66522d558b5b', 'melissaturner', 'Scott', 'Massey', 'wmitchell@example.org', 'A', 'Accounting'),
       ('db5d3a45-2153-46df-91a0-f7d81f342d19', '10c927cd82caa2e4132b0135e39cb1d0e1181164d7ec71206087d06a0d2a59c5', 'patty51', 'Michelle', 'Durham', 'nkelley@example.com', 'A', 'Accounting'),
       ('6a352c20-b3d8-42f2-9fa1-3560395b8c1d', '34b36cdc15cc436222c8f417e6d4c09e7806edb5f753ad92e8864f3b004cd743', 'rodriguezanthony', 'Peter', 'Knox', 'wallacechristian@example.org', 'I', 'IT'),
       ('36e099b5-2df8-4a2d-97e8-250822c27f1a', '8f8494016ab70956deb090ff9ab74395916d89c0bd23db1be06efa22407d5ba2', 'davisalexander', 'Daniel', 'Sweeney', 'donnaallen@example.org', 'I', 'Health'),
       ('6406f2a9-af0a-45b2-a7ef-8f0ff8ace02a', '00dca20866e57aa03b9255b16db4ded920543ae93111394bd74c274522180964', 'ematthews', 'Margaret', 'Jacobs', 'melanie40@example.net', 'T', 'Biotech'),
       ('daa7f900-f15b-488b-8f64-5ac5ec7fc7c1', '0ffc399798f98b106233b1d66dcc25909ac8cc398e8435d724e798f63d938e34', 'michael41', 'Kelly', 'Carpenter', 'kimberly83@example.org', 'T', 'IT'),
       ('37eef352-ed0e-489b-98b8-4eb4ba6c09fe', '8659888cf9f2ab083f80b8e2004c47a753e448b7a1cfc62babd4af5c1af6585f', 'christopher82', 'Jaime', 'Kent', 'vhansen@example.net', 'I', 'Accounting'),
       ('f2aa6d13-8b1b-437d-8177-c6412ccd8695', '6b2dc1ecf33fa01ca21e08eddd053640a64fd009e15e80b497cc3b0779f10196', 'mathisamanda', 'Lee', 'Campbell', 'richardcook@example.org', 'A', 'Accounting'),
       ('5015f5da-05e2-4667-9326-1b20e9b3816d', '81a894e3a29f207515cc6c45e4f29f0c9ca9209a3d2146a23af52cb7b3def042', 'laurenreed', 'Joshua', 'Gomez', 'jenniferpham@example.org', 'T', 'Finance'),
       ('9e294b72-64d8-46d1-bee3-02311c35daee', '8cb88855d327ff9467348f08cc49ec98c649341e6894344ae485999aec0258e7', 'oliviataylor', 'Justin', 'Spears', 'williamsjohn@example.net', 'A', 'IT'),
       ('ef409d02-6274-4caa-ac4c-36859211f95c', '4f2625387e180eac489f268b8269360601843a1f83208e383a6bdc66a558b476', 'richardgarrison', 'Christopher', 'Roman', 'ericbrown@example.com', 'A', 'Accounting'),
       ('c7757e6a-ed88-4ded-80ed-ab22b311aa16', 'ac1b64f5f368cf7d7df0ea4ce9d817b42eb640f1063be3caf49b3b1206400c88', 'hannah03', 'Ashley', 'Cochran', 'williamsontimothy@example.org', 'A', 'Biotech'),
       ('34be6d08-b49a-4942-a02d-042bf00c1023', '32e421d849bffcafb0539cddb5f82d98025bd71e57c0ffa4e500c38d43aef9b4', 'timothy63', 'Kenneth', 'Stout', 'paulaodonnell@example.net', 'A', 'IT'),
       ('4c991ffa-6654-4358-a6ad-a597f0aeb042', '477e5c853f80d678d52198012c47683f83d7f9187efdb95cc7ad1e5d2dd9b493', 'ericmurphy', 'Paul', 'Morse', 'danielhatfield@example.org', 'A', 'Accounting'),
       ('43922b07-3b6b-4d13-b98b-408a58c1df19', 'df7cc49bd442ac5582e08c733695f2309155160ec5d949f5091f37fe96a9bf90', 'johnsonderek', 'Brandon', 'Lowe', 'brandon82@example.net', 'A', 'IT'),
       ('9c15f9bf-cae9-40f1-a751-c9822ea5a6cf', '4436a0ca23d9437019b02614fddf47f04e83f200b52d3250b954de396fc0d817', 'cindyjones', 'Sabrina', 'Ward', 'melissakennedy@example.com', 'T', 'Biotech'),
       ('cd61749e-8abd-490c-b073-e5a3b7d90ec8', '2e3d821bf390d00fb65a5fb2e419ffa1914d6c777dac9eab8b72109976be4941', 'qpatrick', 'Matthew', 'Reyes', 'kara67@example.com', 'A', 'Biotech'),
       ('6a14382d-d61f-4b91-ad3b-07f0cca9ac8e', '2b8c0ec62704d1a19b83c0dd8e391f2aa181aac7d73c48995ad3cf882d588801', 'pamela07', 'Wayne', 'Lopez', 'kwright@example.com', 'T', 'Health'),
       ('966a5075-bff2-4150-80ce-d64ddafaff24', '46a477fd9ac148f8dbe68bfd5b6d0c802bed5055ececfdee4e500f124bd641a9', 'william61', 'Bryan', 'Smith', 'melissa47@example.org', 'A', 'Finance'),
       ('92aeaaba-78c8-449a-aa84-fe4e8d4f92d5', 'fe293224312010418e61e83dd069421fc495c76616a830b7d9e09460a43cad45', 'kaitlynjohnson', 'Sean', 'Brewer', 'robin72@example.net', 'T', 'Biotech'),
       ('5c0f114d-5fdb-4138-8a58-a93f3da2fa4b', '7df50e9757b4d22300d65fc0285234a1757517b42be8a615a3e697287cc6be96', 'amorris', 'Steven', 'Garner', 'williamsmathew@example.net', 'A', 'Health'),
       ('137e663d-5875-42a0-b307-8552ca70dbfb', '44893739e6a459f5ccd852c383d0938f4011640366ca8a3e36cb2459ce79e1a8', 'conniekelley', 'Matthew', 'Mckenzie', 'hollowaylisa@example.org', 'A', 'Biotech'),
       ('fb83f3ad-3f0a-466c-8709-cd08bce668f0', '00b4d40d581373482d9abc8fdd86fa8abca227573f122c9b3302ee4a4896ad63', 'scott76', 'Daniel', 'Meyers', 'sharrington@example.net', 'T', 'Finance'),
       ('75560e60-7665-4ad2-9f08-2bf9976d46cc', '647534955f1fdcd6171c07abe648aba56fb842093818c544677246a842acab46', 'jacob16', 'Cameron', 'Peterson', 'allenmelissa@example.net', 'A', 'Finance'),
       ('ef512ec4-8130-4632-8452-00ce97864f5b', '7c4b8e741d2f2ae4d3ffdf171985488b30a9f03f74d6b980c6c37acfc21e64bc', 'ppark', 'Deanna', 'Zimmerman', 'donaldcalderon@example.com', 'I', 'Biotech'),
       ('ebbc0768-be00-49dd-9617-68da4ad60ec6', '764b114b72e1bc476d91fad7847d32616d49989dfc08131dca6a8f80e67f1d90', 'travis89', 'Cindy', 'Barber', 'jesusjenkins@example.net', 'T', 'IT'),
       ('dd165624-bdee-4efa-97fe-7204d3efb2d5', 'f93566a141b8f0c0a93abaee45725b34c5dace95dac883a5f194d032198d475d', 'perrytommy', 'Monica', 'Perry', 'christina61@example.net', 'A', 'Accounting'),
       ('4d126c3e-36b1-4ded-abd1-75dd08d50d8a', '92fa2a84891cbe794d26016353ebd00ef81d3639e2f4c48339421a8f3bf92c8e', 'hollyperry', 'Greg', 'Williams', 'connie73@example.net', 'T', 'Accounting'),
       ('38951753-2bf6-464a-803d-51204950d858', 'e19a2e971543e28cc0011d01f8b5dcb042412c5942a37569202dc5275ea19029', 'gwhite', 'Daniel', 'Davis', 'robert13@example.com', 'T', 'Health'),
       ('3f419db4-adbb-49f9-bd25-afc22e384663', '8d7d9bf12fe57f7829656708171b2f0ee5dad89bf24bae11e1bac509cae274b5', 'powellluke', 'Mary', 'Landry', 'amy71@example.net', 'A', 'IT'),
       ('8c371e4f-8dc5-4a6b-b605-24062e1437d1', 'ee1ff54176a7551973e00d51ef6845bb6c9bc660a06fdba7de3190d86eede7c1', 'wayne73', 'Barbara', 'Butler', 'sethcastro@example.com', 'I', 'Health'),
       ('96c76874-2d87-4d4b-8f56-25ed80137b1f', 'd521769726b34cc640e0473ab7c433724c524348278096603023364ff84fffbb', 'spencerlucero', 'Julia', 'Camacho', 'andrea13@example.com', 'T', 'IT'),
       ('700240f5-c3be-41c3-a618-381957df4687', '708cb9a29706e2ed49a87c31d6bbaa4416fe359d4d54c3bad43d71243bd722fb', 'morganbrendan', 'Patrick', 'Cruz', 'stephen39@example.org', 'A', 'IT'),
       ('47ea412a-e8e6-4bf6-a355-a0ec6810a35c', '1b0be39aca0b209b3157fb39c431746fa167de7bc01b54b53c33df57181daa4d', 'stephen99', 'Linda', 'Thomas', 'ijames@example.com', 'A', 'Biotech'),
       ('6e1fa3e9-b522-4b61-9bf2-15a4d248bf34', '5e12e265d0e40a583d593be4efb99015e454617f5d733ec5c6cd2028e74c8b1a', 'david97', 'Alex', 'Martin', 'berryjessica@example.net', 'T', 'Finance'),
       ('6f21922d-8829-45dd-9910-b7bef5df14a3', '512a572c9be0ffdfdffeebc5ba6fea66e4162db41a222555856130dbc5cfd87f', 'derek70', 'Matthew', 'Richardson', 'melissakim@example.com', 'A', 'Finance'),
       ('3ebf4018-15fd-4833-98af-42c9d6d6688f', '6375ca732aa51816b745a533b708767a659c3b601d8fd3c6764328ed5e1f7fc3', 'alexandermurphy', 'Benjamin', 'Lawson', 'stephanie48@example.org', 'I', 'Health'),
       ('23d46b33-0eb4-4514-950b-0adb15756060', '529551db090ceb1bc89c732b090f51c5146e212fad803dc2d994bce11c72c442', 'leeelizabeth', 'Margaret', 'Thomas', 'onewman@example.com', 'A', 'Biotech'),
       ('9f50010b-f014-4aa0-851a-bc11fa39d84e', 'c7f5ef8f85a4e572fb19f452dc880a3217d6c0f9a88244764abd0d72479c3343', 'polson', 'Peter', 'Murphy', 'powersronald@example.org', 'T', 'Health'),
       ('ce8f3842-36ff-4046-bc78-7fc6c406c956', 'b0475127f7761abea6ad7bb8fbf3ee0879136e07e9a8c461aadfb601f57d87fc', 'amanda66', 'Christopher', 'Jordan', 'kaneerica@example.com', 'I', 'IT'),
       ('5a667362-780b-4bfa-a19c-667d1f2c8945', 'e9d9d7edc062849e4183e848cca2ff34e0dc1f22871fbc3f4a24dbfb399ea143', 'kbaker', 'Peter', 'Guerrero', 'oscarevans@example.org', 'A', 'Finance'),
       ('67ffab3e-c5ad-4c20-96cf-a1800fe25f3d', '3d0ee65794aa8b2981fd2783467f141fcac00b3e3d3f9826e1ea196e77c55c61', 'jonessherry', 'Erin', 'Crawford', 'castrotodd@example.net', 'T', 'IT'),
       ('7754cdf2-c1ec-426d-9569-8bd657df831f', '9b4db43131e5246baa0e9d43883868603b2e84bfc594bbc8849cb6060ade3cc5', 'dennis00', 'Tommy', 'Carr', 'awilson@example.net', 'I', 'Accounting'),
       ('698a0c5c-5500-4f47-8204-44986be60e30', '9ba52d40af73bb8ca9494ea9da4eacb2744675d6024a74435f63ced86d5a9052', 'jimenezrandall', 'Robert', 'Sullivan', 'laurienorris@example.com', 'I', 'Biotech'),
       ('bb67d6b2-ac2d-44f2-a1c1-4f6a1658c80d', '49b121df7fd777f96783156f500140cd205b9e8306ac1391756a22ee137661e5', 'kwhite', 'Nicole', 'Huynh', 'hilldanielle@example.org', 'A', 'Accounting'),
       ('810b1319-3c9b-4327-a743-ddafbde7d009', 'dffb5141fd421ec86e28d189b8c3c8468556c9a5b45e02347c8df66749141476', 'jessica23', 'Matthew', 'Moore', 'robbinskelsey@example.com', 'I', 'IT'),
       ('bafc341b-32dd-4ac8-b9f2-de89a5c4b658', '2579f39768e87a06ea62c093bba40ae3c2fd787b6e01f72b46eb68d42f62975b', 'erik41', 'Jamie', 'Brown', 'reynoldsjoshua@example.net', 'T', 'Accounting'),
       ('fc55db49-0f12-4094-89a9-cb289296850d', 'b4042531f67ad3ac264c6e71805b2e5fda2a8afac34c1e291eab3385dab2ac59', 'markmunoz', 'Jamie', 'Gutierrez', 'mlee@example.org', 'I', 'IT')
EOSQL
