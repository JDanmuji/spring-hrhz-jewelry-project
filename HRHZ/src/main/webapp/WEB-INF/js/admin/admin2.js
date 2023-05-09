$(document).ready(function () {
    $.ajax({
        type: "post",
        url: "/admin/getMemberList",
        success: function (data) {
            $.each(data, function (index, items) {
                console.log(items);

                var memberListHTML =
                    "<tr><td>" +
                    items.email +
                    "</td>" +
                    "<td>" +
                    items.name +
                    "</td>" +
                    "<td>" +
                    items.phone +
                    "</td>" +
                    "<td>" +
                    items.regDate +
                    "</td></tr>";

                $(".memberListTB").append(memberListHTML);
            }); // each
        },
        error: function (err) {
            console.log(err);
        },
    });


    $.ajax({
        type: "post",
        url: "/admin/getBrand",
        data: "brandCode=" + brandCode,
        success: function (data) {
            console.log(data);

            $(".brandName").val(data.name);
            $(".representativeNumber").val(data.phone);
            $(".brandEmail").val(data.email);
            $(".businessLocation").val(data.address);
            $(".returnAddress").val(data.returnAddress);
            $(".deliveryCharge").val(data.deliveryFee);
            $(".kakaotalk").val(data.kakaoId);
            $(".instagram").val(data.instagramId);
        },
        error: function (err) {
            console.log(err);
        },
    });

});












