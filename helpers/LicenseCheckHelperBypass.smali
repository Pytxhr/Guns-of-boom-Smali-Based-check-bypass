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
    .locals 0

    return-void
.end method


.method public static CheckLicense(Landroid/app/Activity;)V
    .locals 0

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
    const/4 v0, 0x0  # Null for bypassing

    sget-object v0, Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;->OK:Lcom/gameinsight/gobandroid/helpers/LicenseCheckHelper$LicenseCheckStatus;  # Always return OK status

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
    .locals 1

    const-string v0, "wNDhbiEKZ4YhMzLm+ADju/aQon4="  # This is the expected signature string.

    return-object v0
.end method


.method public static verifyInstallerId()Z
    .locals 1

    const/4 v0, 0x1  # 0x1 is true in boolean context.

    return v0
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

