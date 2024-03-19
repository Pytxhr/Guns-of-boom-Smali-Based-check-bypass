.class public Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;
.super Ljava/lang/Object;
.source "LicenseCheckHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;
    }
.end annotation


# static fields
.field private static final SALT:[B

.field private static final TAG:Ljava/lang/String; = "LicenseCheckHelper"

.field private static mCheckStatus:Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;

.field private static mChecker:Lcom/google/android/vending/licensing/LicenseChecker;

.field private static mLicCode:I

.field private static mPolicy:Lcom/google/android/vending/licensing/APKExpansionPolicy;

.field private static mRetryCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 54
    sget-object v0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;->NOT_CHECKED:Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;

    sput-object v0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mCheckStatus:Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;

    const/4 v0, 0x0

    .line 56
    sput v0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mRetryCount:I

    .line 57
    sput v0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mLicCode:I

    const/16 v0, 0x14

    new-array v0, v0, [B

    .line 68
    fill-array-data v0, :array_0

    sput-object v0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->SALT:[B

    return-void

    nop

    :array_0
    .array-data 1
        0x42t
        0x1at
        0x2bt
        -0x7bt
        0x54t
        -0x6ft
        -0x24t
        -0x7bt
        -0x1ft
        0x5bt
        0x1dt
        -0x23t
        0x2bt
        -0x3at
        0x56t
        -0x61t
        -0x18t
        -0x1bt
        0x40t
        -0x71t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static CheckAccess()V
    .locals 3

    const-string v0, "LicenseCheckHelper"

    :try_start_0
    const-string v1, "GI Licensing: --- Checking ---"

    .line 162
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    sget-object v1, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mChecker:Lcom/google/android/vending/licensing/LicenseChecker;

    new-instance v2, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$2;

    invoke-direct {v2}, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$2;-><init>()V

    invoke-virtual {v1, v2}, Lcom/google/android/vending/licensing/LicenseChecker;->checkAccess(Lcom/google/android/vending/licensing/LicenseCheckerCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v1, "GI Licensing: Exception during checking"

    .line 249
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public static CheckLicense(Landroid/app/Activity;)V
    .locals 7

    const-string v0, "LicenseCheckHelper"

    const-string v1, "GI Licensing: --- Initing ---"

    .line 93
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    :try_start_0
    invoke-static {}, Lcom/gameinsight/gobandroid/GunsOfBoomActivity;->getUnityActivity()Landroid/app/Activity;

    move-result-object v1

    .line 98
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "android_id"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 99
    sget v3, Lcom/gameinsight/gobandroid/plugins/gob/R$string;->LicensePublicKey:I

    invoke-virtual {p0, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 100
    new-instance v3, Lcom/google/android/vending/licensing/APKExpansionPolicy;

    new-instance v4, Lcom/google/android/vending/licensing/AESObfuscator;

    sget-object v5, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->SALT:[B

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, v2}, Lcom/google/android/vending/licensing/AESObfuscator;-><init>([BLjava/lang/String;Ljava/lang/String;)V

    invoke-direct {v3, v1, v4}, Lcom/google/android/vending/licensing/APKExpansionPolicy;-><init>(Landroid/content/Context;Lcom/google/android/vending/licensing/Obfuscator;)V

    sput-object v3, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mPolicy:Lcom/google/android/vending/licensing/APKExpansionPolicy;

    .line 101
    invoke-virtual {v3}, Lcom/google/android/vending/licensing/APKExpansionPolicy;->resetPolicy()V

    .line 102
    new-instance v2, Lcom/google/android/vending/licensing/LicenseChecker;

    sget-object v3, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mPolicy:Lcom/google/android/vending/licensing/APKExpansionPolicy;

    invoke-direct {v2, v1, v3, p0}, Lcom/google/android/vending/licensing/LicenseChecker;-><init>(Landroid/content/Context;Lcom/google/android/vending/licensing/Policy;Ljava/lang/String;)V

    sput-object v2, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mChecker:Lcom/google/android/vending/licensing/LicenseChecker;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "GI Licensing: Exception during init"

    .line 105
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    :goto_0
    invoke-static {}, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->CheckAccess()V

    return-void
.end method

.method public static Failed()V
    .locals 2

    const-string v0, "LicenseCheckHelper"

    const-string v1, "GI Licensing: Is failed"

    .line 265
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    sget-object v0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;->FAIL:Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;

    sput-object v0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mCheckStatus:Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;

    .line 267
    invoke-static {}, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->OnFinishLicenseChecking()V

    return-void
.end method

.method public static GetCheckStatus()Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;
    .locals 1

    .line 260
    sget-object v0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mCheckStatus:Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;

    return-object v0
.end method

.method public static GetLicCode()I
    .locals 1

    .line 255
    sget v0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mLicCode:I

    return v0
.end method

.method public static OnDestroy()V
    .locals 1

    .line 61
    sget-object v0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mChecker:Lcom/google/android/vending/licensing/LicenseChecker;

    if-eqz v0, :cond_0

    .line 63
    invoke-virtual {v0}, Lcom/google/android/vending/licensing/LicenseChecker;->onDestroy()V

    const/4 v0, 0x0

    .line 64
    sput-object v0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mChecker:Lcom/google/android/vending/licensing/LicenseChecker;

    :cond_0
    return-void
.end method

.method private static OnFinishLicenseChecking()V
    .locals 0

    return-void
.end method

.method public static Retry()V
    .locals 3

    const-string v0, "LicenseCheckHelper"

    const-string v1, "GI Licensing: Is retried"

    .line 118
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    sget-object v1, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;->RETRY_CHECKING:Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;

    sput-object v1, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mCheckStatus:Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;

    .line 120
    sget v1, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mRetryCount:I

    if-lez v1, :cond_0

    add-int/lit8 v1, v1, -0x1

    .line 122
    sput v1, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mRetryCount:I

    .line 133
    :try_start_0
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$1;

    invoke-direct {v2}, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$1;-><init>()V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 151
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v1, "GI Licensing: Exception during retry"

    .line 154
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void

    .line 126
    :cond_0
    sget-object v0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;->RETRY_COUNT_EXCEEDED:Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;

    sput-object v0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mCheckStatus:Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;

    .line 127
    invoke-static {}, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->OnFinishLicenseChecking()V

    return-void
.end method

.method private static Success()V
    .locals 2

    const-string v0, "LicenseCheckHelper"

    const-string v1, "GI Licensing: Is allowed"

    .line 272
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    sget-object v0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;->OK:Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;

    sput-object v0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mCheckStatus:Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;

    .line 274
    invoke-static {}, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->OnFinishLicenseChecking()V

    return-void
.end method

.method static synthetic access$002(I)I
    .locals 0

    .line 26
    sput p0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mLicCode:I

    return p0
.end method

.method static synthetic access$102(Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;)Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;
    .locals 0

    .line 26
    sput-object p0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mCheckStatus:Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;

    return-object p0
.end method

.method static synthetic access$200()Lcom/google/android/vending/licensing/APKExpansionPolicy;
    .locals 1

    .line 26
    sget-object v0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->mPolicy:Lcom/google/android/vending/licensing/APKExpansionPolicy;

    return-object v0
.end method

.method static synthetic access$300()V
    .locals 0

    .line 26
    invoke-static {}, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->Success()V

    return-void
.end method

.method private static getCurrentSignature()Ljava/lang/String;
    .locals 7

    .line 307
    invoke-static {}, Lcom/gameinsight/gobandroid/GunsOfBoomActivity;->getUnityActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, ""

    if-eqz v0, :cond_0

    .line 312
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const/16 v3, 0x40

    invoke-virtual {v2, v0, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 313
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    array-length v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_0

    aget-object v5, v0, v4

    const-string v6, "SHA"

    .line 315
    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v6

    .line 316
    invoke-virtual {v5}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/security/MessageDigest;->update([B)V

    .line 317
    invoke-virtual {v6}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v5

    invoke-static {v5, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 324
    :catch_0
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static verifyInstallerId()Z
    .locals 4

    .line 284
    invoke-static {}, Lcom/gameinsight/gobandroid/GunsOfBoomActivity;->getUnityActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 287
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 288
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "LicenseCheckHelper::verifyInstallerId installer = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "LicenseCheckHelper"

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_0

    const-string v1, "com.android.vending"

    .line 291
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    :cond_0
    return v1
.end method

.method public static verifySigningCertificate()Z
    .locals 2

    .line 279
    invoke-static {}, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper;->getCurrentSignature()Ljava/lang/String;

    move-result-object v0

    const-string v1, "wNDhbiEKZ4YhMzLm+ADju/aQon4="

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
