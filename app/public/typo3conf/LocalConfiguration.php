<?php
return [
    'BE' => [
        'explicitADmode' => 'explicitAllow',
    ],
    'DB' => [
        'Connections' => [
            'Default' => [
                'charset' => 'utf8',
                'driver' => 'mysqli',
            ],
        ],
    ],
    'EXTENSIONS' => [
        'backend' => [
            'backendFavicon' => '',
            'backendLogo' => '',
            'loginBackgroundImage' => '',
            'loginFootnote' => '',
            'loginHighlightColor' => '',
            'loginLogo' => '',
            'loginLogoAlt' => '',
        ],
        'extensionmanager' => [
            'automaticInstallation' => '1',
            'offlineMode' => '0',
        ],
    ],
    'FE' => [
        'disableNoCacheParameter' => true,
    ],
    'SYS' => [
        'encryptionKey' => 'b104dd2518cbec609eb2a433ac95a5ddacf27809f6751011294f370b61e2e235e31f2f60f192beccd82da20e4798a691',
        'features' => [
            'unifiedPageTranslationHandling' => true,
            'yamlImportsFollowDeclarationOrder' => true,
        ],
        'sitename' => 'New TYPO3 site',
    ],
];
