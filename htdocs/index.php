<?php
    require("dbconfig.php");
    require("dbwrapper.php");

    //Open connection and query the database for all the dogs
    $conn = DBOpen();
    $query = DBQueryNoDML($conn,"SELECT dogs.name AS dog_name,breeds.name AS breed_name FROM dogs LEFT JOIN breeds ON breeds.id = dogs.breed GROUP BY dogs.id",MYSQLI_ASSOC);
    if ($query[0]) {
        $dogsData = $query[1];
    } else {
        $errorMsg = "A database issue occured, please try again later!";
    }

    //Categorize the dogs in an associative array
    $catDogs = []; 
    foreach ($dogsData as $dog) {
        $breed = $dog["breed_name"];
        $name = $dog["dog_name"];
        if (array_key_exists($breed,$catDogs)) {
            $catDogs[$breed] = $catDogs[$breed] . ", " . $name;
        } else {
            $catDogs[$breed] = $name;
        }
    }

    //Format the data so bootstrap-table can work with it
    $catDogsData = [];
    foreach ($catDogs as $breed => $dogName) {
        $newArr["breed_name"] = $breed;
        $newArr["dog_name"] = $dogName;
        array_push($catDogsData,$newArr);
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-table.min.css"> 
</head>

<body>
    <script src="../js/jquery-3.6.0.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="../js/bootstrap-table.min.js"></script>

    <div class="container">
        <div class="row mt-0 mb-5">
            <div class="col-sm">
                <div class="text-center">
                    <h1>All Dogs</h1>         
                    <table
                    class="text-primary mt-2"
                    id="table"
                    data-sortable="true"
                    data-detail-view="false"
                    >
                    <thead>
                        <tr>
                            <th data-field="dog_name" data-sortable="true">Dog name</th>
                            <th data-field="breed_name" data-sortable="true">Breed</th>
                        </tr>
                    </thead>
                    </table>                                   
                    <br />
                    <h1>Categorized Dogs</h2>         
                    <table
                    class="text-primary"
                    id="tableCategorized"
                    data-sortable="true"
                    data-detail-view="false"
                    >
                    <thead>
                        <tr>
                            <th data-field="breed_name" data-sortable="true">Breed</th>
                            <th data-field="dog_name" data-sortable="true">Dog name</th>
                        </tr>
                    </thead>
                    </table>    
                </div>                                            
            </div>                
        </div>       
    </div>

    <script>
        const table = $("#table");
        const tableCategorized = $("#tableCategorized");
        const dogs = <?php echo json_encode($dogsData); ?>;
        const categorizedDogs = <?php echo json_encode($catDogsData); ?>;
        const error = <?php echo json_encode($errorMsg ?? null); ?>;

        //Some kind of error could be displayed to the user here
        if (error) {
        }

        if (error == null) {
            table.bootstrapTable({data: dogs});
            tableCategorized.bootstrapTable({data: categorizedDogs});
        }

    </script>
</body>




