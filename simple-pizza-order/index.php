<?php
require_once("src/db.php");
require_once("src/session.php");

$db = new Db();
$sess = new Session();

$userData = $sess->getData();
$cart = $sess->getCart();

$classicPizzas = $db->getPizzas("CLASSIC PIZZA");
$specialtyPizzas = $db->getPizzas("SPECIALTY PIZZA");
$toppings = $db->getToppings();

$pizzas = array_merge($classicPizzas, $specialtyPizzas);

$grandTotal = 0;

foreach ($cart as $row) {
    if ($row["isPizza"]) $subTotal = $row["qty"] * $pizzas[$row["id"] - 1]["size_and_price"][$row["size"]];
    else $subTotal = $toppings[$row["id"] - 1]["size_and_price"][$row["size"]];
    $grandTotal += $subTotal;
}

?>
<!DOCTYPE html>
<html>
<head>
    <title>Pizza Ordering</title>
    <script src="assets/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="assets/main.css?<?= date("His") ?>">

    <script>
        $(document).ready(function () {
            $(".add").click(function () {
                var id = $(this).attr("data-pizza");
                if (!$("input[name='size-" + id + "']:checked").val()) alert("select pizza size");
                else {
                    var size = $("input[name='size-" + id + "']:checked").val();
                    var qty = $("input[name='qty-" + id + "']").val();
                    if (qty > 0) {
                        var data = "add" + "&id=" + encodeURIComponent(id) + "&size=" + encodeURIComponent(size) + "&qty=" + encodeURIComponent(qty);
                        $.ajax({
                            url: "src/request.php",
                            type: "post",
                            data: data,
                            success: function (ret) {
                                alert(ret);
                                location.reload();
                            }
                        });
                    } else alert("enter quantity");
                }
            });
            $(".add-toppings").click(function () {
                var id = $(this).attr("data-toppings");
                if (!$("input[name='size-t-" + id + "']:checked").val()) alert("select toppings size");
                else {
                    var size = $("input[name='size-t-" + id + "']:checked").val();
                    var data = "add-toppings" + "&id=" + encodeURIComponent(id) + "&size=" + encodeURIComponent(size);
                    $.ajax({
                        url: "src/request.php",
                        type: "post",
                        data: data,
                        success: function (ret) {
                            alert(ret);
                            location.reload();
                        }
                    });
                }
            });

            $(".remove").click(function () {
                var id = $(this).attr("data-pizza");
                var data = "remove&id=" + encodeURIComponent(id);
                $.ajax({
                    url: "src/request.php",
                    type: "post",
                    data: data,
                    success: function (ret) {
                        alert(ret);
                        location.reload();
                    }
                });
            });

            $(".remove-toppings").click(function () {
                var id = $(this).attr("data-toppings");
                var data = "remove-toppings&id=" + encodeURIComponent(id);
                $.ajax({
                    url: "src/request.php",
                    type: "post",
                    data: data,
                    success: function (ret) {
                        alert(ret);
                        location.reload();
                    }
                });
            });
        });
    </script>
</head>
<body>
<header></header>
<div class="intro">
    <div class="instructions">
        <h4>Instructions:</h4>
        <ol>
            <li>Введите количество для заказа.</li>
            <li>Нажмите кнопку ДОБАВИТЬ, чтобы добавить товары в корзину, УДАЛИТЬ, чтобы удалить товары из корзины.</li>
            <li>Нажмите ОБНОВИТЬ, если вы внесли изменения в свои заказы.</li>
        </ol>
    </div>

    <div class="summary">
        <p class="total_purchase_order">TOTAL PURCHASE ORDER</p>
        <div class="total"><?= number_format($grandTotal, 2) ?></div>
        <p class="note">Все цены представленны в Lei(MD)</p>
    </div>
</div>

<form>
    <table id="menu">
        <tr class="row_header">
            <td>CLASSIC PIZZA</td>
            <td>
                <p>10"</p>
                <p>14"</p>
                <p>18"</p>
            </td>
            <td>QTY</td>
            <td>Sub Total</td>
            <td>Add</td>
            <td>Remove</td>
        </tr><?php
        foreach ($classicPizzas

                 as $row){
        $onCart = isset($cart["p-" . $row["id"]]) ?>
        <tr>
            <td>
                <p><?= $row["name"] ?></p>
                <p><?= $row["description"] ?></p>
            </td>
            <td>
                <input title="<?= $row["size_and_price"][10] ?>" type="radio" value="10"
                       name="size-<?= $row["id"] ?>"<?= $onCart && $cart["p-" . $row["id"]]["size"] == 10 ? " checked" : ""; ?>>
                <input title="<?= $row["size_and_price"][14] ?>" type="radio" value="14"
                       name="size-<?= $row["id"] ?>"<?= $onCart && $cart["p-" . $row["id"]]["size"] == 14 ? " checked" : ""; ?>>
                <input title="<?= $row["size_and_price"][18] ?>" type="radio" value="18"
                       name="size-<?= $row["id"] ?>"<?= $onCart && $cart["p-" . $row["id"]]["size"] == 18 ? " checked" : ""; ?>>
            </td>
            <td><input type="number" value="<?= $onCart ? $cart["p-" . $row["id"]]["qty"] : 0 ?>"
                       name="qty-<?= $row["id"] ?>"></td>
            <td>
                <!-- calculate subtotal: price of size * quantity -->
                <p><?= $onCart ? number_format($cart["p-" . $row["id"]]["qty"] * $row["size_and_price"][$cart["p-" . $row["id"]]["size"]], 2) : "0.00" ?></p>
            </td>
            <td>
                <button type="button" class="add"
                        data-pizza="<?= $row["id"] ?>"><?= $onCart ? "UPDATE" : "ADD" ?></button>
            </td>
            <td>
                <button type="button" class="remove" data-pizza="<?= $row["id"] ?>">REMOVE</button>
            </td>
        </tr>
        <?php }
        ?><!-- vertical white space-->
        <tr>
            <td><br></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>

        <tr class="row_header">
            <td>SPECIALTY PIZZA</td>
            <td>
                <p>10"</p>
                <p>14"</p>
                <p>18"</p>
            </td>
            <td>QTY</td>
            <td>Sub Total</td>
            <td>Add</td>
            <td>Remove</td>
        </tr><?php
        foreach ($specialtyPizzas

                 as $row){
        $onCart = isset($cart["p-" . $row["id"]]) ?>
        <tr>
            <td>
                <p><?= $row["name"] ?></p>
                <p><?= $row["description"] ?></p>
            </td>
            <td>
                <input title="<?= $row["size_and_price"][10] ?>" type="radio" value="10"
                       name="size-<?= $row["id"] ?>"<?= $onCart && $cart["p-" . $row["id"]]["size"] == 10 ? " checked" : ""; ?>>
                <input title="<?= $row["size_and_price"][14] ?>" type="radio" value="14"
                       name="size-<?= $row["id"] ?>"<?= $onCart && $cart["p-" . $row["id"]]["size"] == 14 ? " checked" : ""; ?>>
                <input title="<?= $row["size_and_price"][18] ?>" type="radio" value="18"
                       name="size-<?= $row["id"] ?>"<?= $onCart && $cart["p-" . $row["id"]]["size"] == 18 ? " checked" : ""; ?>>
            </td>
            <td><input type="number" value="<?= $onCart ? $cart["p-" . $row["id"]]["qty"] : 0 ?>"
                       name="qty-<?= $row["id"] ?>"></td>
            <td>
                <!-- calculate subtotal: price of size * quantity -->
                <p><?= $onCart ? number_format($cart["p-" . $row["id"]]["qty"] * $row["size_and_price"][$cart["p-" . $row["id"]]["size"]], 2) : "0.00" ?></p>
            </td>
            <td>
                <button type="button" class="add"
                        data-pizza="<?= $row["id"] ?>"><?= $onCart ? "UPDATE" : "ADD" ?></button>
            </td>
            <td>
                <button type="button" class="remove" data-pizza="<?= $row["id"] ?>">REMOVE</button>
            </td>
        </tr>
        <?php }
        ?><!-- vertical white space-->
        <tr>
            <td><br></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>

        <tr class="row_header">
            <td>MORE TOPPINGS</td>
            <td>
                <p>10"</p>
                <p>14"</p>
                <p>18"</p>
            </td>
            <td>QTY</td>
            <td>Sub Total</td>
            <td>Add</td>
            <td>Remove</td>
        </tr><?php
        foreach ($toppings as $row) {
            $onCart = isset($cart["t-" . $row["id"]]) ?>
            <tr>
                <td><?= $row["name"] ?></td>
                <td>
                    <input title="<?= $row["size_and_price"][10] ?>" type="radio" value="10"
                           name="size-t-<?= $row["id"] ?>"<?= $onCart && $cart["t-" . $row["id"]]["size"] == 10 ? " checked" : ""; ?>>
                    <input title="<?= $row["size_and_price"][14] ?>" type="radio" value="14"
                           name="size-t-<?= $row["id"] ?>"<?= $onCart && $cart["t-" . $row["id"]]["size"] == 14 ? " checked" : ""; ?>>
                    <input title="<?= $row["size_and_price"][18] ?>" type="radio" value="18"
                           name="size-t-<?= $row["id"] ?>"<?= $onCart && $cart["t-" . $row["id"]]["size"] == 18 ? " checked" : ""; ?>>
                </td>
                <td></td>
                <td>
                    <!-- calculate subtotal: price of size * quantity -->
                    <p><?= $onCart ? number_format($row["size_and_price"][$cart["t-" . $row["id"]]["size"]]) : "0.00" ?></p>
                </td>
                <td>
                    <button type="button" class="add-toppings"
                            data-toppings="<?= $row["id"] ?>"><?= $onCart ? "UPDATE" : "ADD" ?></button>
                </td>
                <td>
                    <button type="button" class="remove-toppings" data-toppings="<?= $row["id"] ?>">REMOVE</button>
                </td>
            </tr>
        <?php }
        ?>
    </table>
</form>
<a id="place-order" href="order.php">PLACE ORDER</a>

</body>
<footer>
</footer>
</html>
