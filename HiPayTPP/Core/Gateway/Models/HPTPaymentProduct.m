//
//  HPTPaymentProduct.m
//  Pods
//
//  Created by Jonathan TIRET on 20/10/2015.
//
//

#import "HPTPaymentProduct.h"

NSString *const HPTPaymentProductCode3xcb                   = @"3xcb";
NSString *const HPTPaymentProductCode3xcbNoFees             = @"3xcb-no-fees";
NSString *const HPTPaymentProductCode4xcb                   = @"4xcb";
NSString *const HPTPaymentProductCode4xcbNoFees             = @"4xcb-no-fees";
NSString *const HPTPaymentProductCodeAmericanExpress        = @"american-express";
NSString *const HPTPaymentProductCodeArgencard              = @"argencard";
NSString *const HPTPaymentProductCodeBaloto                 = @"baloto";
NSString *const HPTPaymentProductCodeBankTransfer           = @"bank-transfer";
NSString *const HPTPaymentProductCodeBCMC                   = @"bcmc";
NSString *const HPTPaymentProductCodeBCMCMobile             = @"bcmc-mobile";
NSString *const HPTPaymentProductCodeBCP                    = @"bcp";
NSString *const HPTPaymentProductCodeBitcoin                = @"bitcoin";
NSString *const HPTPaymentProductCodeCabal                  = @"cabal";
NSString *const HPTPaymentProductCodeCarteAccord            = @"carte-accord";
NSString *const HPTPaymentProductCodeCB                     = @"cb";
NSString *const HPTPaymentProductCodeCBCOnline              = @"cbc-online";
NSString *const HPTPaymentProductCodeCensosud               = @"censosud";
NSString *const HPTPaymentProductCodeCobroExpress           = @"cobro-express";
NSString *const HPTPaymentProductCodeCofinoga               = @"cofinoga";
NSString *const HPTPaymentProductCodeDexiaDirectNet         = @"dexia-directnet";
NSString *const HPTPaymentProductCodeDiners                 = @"diners";
NSString *const HPTPaymentProductCodeEfecty                 = @"efecty";
NSString *const HPTPaymentProductCodeElo                    = @"elo";
NSString *const HPTPaymentProductCodeGiropay                = @"giropay";
NSString *const HPTPaymentProductCodeIDEAL                  = @"ideal";
NSString *const HPTPaymentProductCodeINGHomepay             = @"ing-homepay";
NSString *const HPTPaymentProductCodeIxe                    = @"ixe";
NSString *const HPTPaymentProductCodeKBCOnline              = @"kbc-online";
NSString *const HPTPaymentProductCodeKlarnacheckout         = @"klarnacheckout";
NSString *const HPTPaymentProductCodeKlarnaInvoice          = @"klarnainvoice";
NSString *const HPTPaymentProductCodeMaestro                = @"maestro";
NSString *const HPTPaymentProductCodeMasterCard             = @"mastercard";
NSString *const HPTPaymentProductCodeNaranja                = @"naranja";
NSString *const HPTPaymentProductCodeOxxo                   = @"oxxo";
NSString *const HPTPaymentProductCodePagoFacil              = @"pago-facil";
NSString *const HPTPaymentProductCodePayPal                 = @"paypal";
NSString *const HPTPaymentProductCodePaysafecard            = @"paysafecard";
NSString *const HPTPaymentProductCodePayULatam              = @"payulatam";
NSString *const HPTPaymentProductCodeProvincia              = @"provincia";
NSString *const HPTPaymentProductCodePrzelewy24             = @"przelewy24";
NSString *const HPTPaymentProductCodeQiwiWallet             = @"qiwi-wallet";
NSString *const HPTPaymentProductCodeRapipago               = @"rapipago";
NSString *const HPTPaymentProductCodeRipsa                  = @"ripsa";
NSString *const HPTPaymentProductCodeSDD                    = @"sdd";
NSString *const HPTPaymentProductCodeSisal                  = @"sisal";
NSString *const HPTPaymentProductCodeSofortUberweisung      = @"sofort-uberweisung";
NSString *const HPTPaymentProductCodeTarjetaShopping        = @"tarjeta-shopping";
NSString *const HPTPaymentProductCodeVisa                   = @"visa";
NSString *const HPTPaymentProductCodeWebmoneyTransfer       = @"webmoney-transfer";
NSString *const HPTPaymentProductCodeYandex                 = @"yandex";
NSString *const HPTPaymentProductCodeDCBAustriaA1           = @"dcb-at-a1";
NSString *const HPTPaymentProductCodeDCBAustriaTMobile      = @"dcb-at-tmobile";
NSString *const HPTPaymentProductCodeDCBAustriaOrange       = @"dcb-at-orange";
NSString *const HPTPaymentProductCodeDCBAustriaDrei         = @"dcb-at-drei";
NSString *const HPTPaymentProductCodeDCBCzetchTMobile       = @"dcb-cz-tmobile";
NSString *const HPTPaymentProductCodeDCBCzetchO2            = @"dcb-cz-o2";
NSString *const HPTPaymentProductCodeDCBCzetchVodafone      = @"dcb-cz-vodafone";
NSString *const HPTPaymentProductCodeDCBBelgiumProximus     = @"dcb-be-proximus";
NSString *const HPTPaymentProductCodeDCBBelgiumMobistar     = @"dcb-be-mobistar";
NSString *const HPTPaymentProductCodeDCBSpainPagosMovistar  = @"dcb-es-pagosmovistar";
NSString *const HPTPaymentProductCodeDCBSingaporeSingtel    = @"dcb-sg-singtel";
NSString *const HPTPaymentProductCodeDCBSwissEasyPay        = @"dcb-ch-easypay";
NSString *const HPTPaymentProductCodeDCBItalyMobilePay      = @"dcb-it-mobilepay";


@implementation HPTPaymentProduct

+ (HPTSecurityCodeType)securityCodeTypeForPaymentProductCode:(NSString *)paymentProductCode
{
    if ([paymentProductCode isEqualToString:HPTPaymentProductCodeVisa] || [paymentProductCode isEqualToString:HPTPaymentProductCodeMasterCard] || [paymentProductCode isEqualToString:HPTPaymentProductCodeDiners] || [paymentProductCode isEqualToString:HPTPaymentProductCodeMaestro]) {
        return HPTSecurityCodeTypeCVV;
    }
    
    else if ([paymentProductCode isEqualToString:HPTPaymentProductCodeAmericanExpress]) {
        return HPTSecurityCodeTypeCID;
    }

    else if ([paymentProductCode isEqualToString:HPTPaymentProductCodeBCMC]) {
        return HPTSecurityCodeTypeNone;
    }
    
    return HPTSecurityCodeTypeNotApplicable;
}

@end
